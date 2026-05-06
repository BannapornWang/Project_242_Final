-- =============================================================================
-- schema.cql
-- Apache Cassandra Data Model — Trading Card Game E-commerce Shop
-- Categories: Yugioh | Vanguard | My Little Pony (MLP) | Gundam
-- =============================================================================
-- Run with:
--   docker exec -it cassandra-node cqlsh -f /cassandra/schema.cql
-- Or paste block-by-block inside an interactive cqlsh session.
-- =============================================================================


-- =============================================================================
-- KEYSPACE
-- =============================================================================

CREATE KEYSPACE IF NOT EXISTS trading_card_shop
  WITH replication = {
    'class'              : 'SimpleStrategy',
    'replication_factor' : 1        -- Single-node dev; use 3 for production
  }
  AND durable_writes = true;

USE trading_card_shop;


-- =============================================================================
-- TABLE 1: products
-- -----------------------------------------------------------------------------
-- PRIMARY ACCESS PATTERN: "Give me all products in a given category"
--   SELECT * FROM products WHERE category = 'yugioh';
--
-- Partition key  : category       → one partition per game brand
-- Clustering key : subcategory    → rows within the partition sorted by subcat
--                  product_id     → unique within subcategory (UUID = time-ordered)
--
-- Data distribution note:
--   Each of our 4 categories (yugioh, vanguard, mlp, gundam) becomes its own
--   partition. All rows for that game live together on the same Cassandra node,
--   making category-level scans extremely fast without ALLOW FILTERING.
-- =============================================================================

CREATE TABLE IF NOT EXISTS trading_card_shop.products (

    -- ── Partition key ────────────────────────────────────────────────────────
    category        TEXT,       -- 'yugioh' | 'vanguard' | 'mlp' | 'gundam'

    -- ── Clustering keys (define sort order within partition) ─────────────────
    subcategory     TEXT,       -- e.g. 'monster_card', 'booster_pack', etc.
    product_id      UUID,       -- timeuuid for chronological ordering

    -- ── Card / product attributes ────────────────────────────────────────────
    name            TEXT,
    description     TEXT,
    price           DECIMAL,    -- Thai Baht (THB)
    stock_quantity  INT,
    rarity          TEXT,       -- 'Common' | 'Rare' | 'Super Rare' | 'Secret Rare' | etc.
    set_name        TEXT,       -- e.g. 'Phantom Nightmare', 'V Extra Booster 16'
    card_number     TEXT,       -- official card/product code
    image_url       TEXT,
    is_available    BOOLEAN,
    created_at      TIMESTAMP,
    updated_at      TIMESTAMP,

    PRIMARY KEY ( category, subcategory, product_id )

) WITH CLUSTERING ORDER BY ( subcategory ASC, product_id ASC )
  AND comment = 'Main product catalog partitioned by TCG category';


-- =============================================================================
-- TABLE 2: products_by_id
-- -----------------------------------------------------------------------------
-- PRIMARY ACCESS PATTERN: "Look up a single product by its UUID"
--   SELECT * FROM products_by_id WHERE product_id = <uuid>;
--
-- This is a query-first denormalization: we duplicate the full product row
-- so that direct lookups never need to know the category partition key.
-- =============================================================================

CREATE TABLE IF NOT EXISTS trading_card_shop.products_by_id (

    product_id      UUID        PRIMARY KEY,    -- direct lookup, no clustering needed

    -- Duplicate all columns (denormalized for query independence)
    category        TEXT,
    subcategory     TEXT,
    name            TEXT,
    description     TEXT,
    price           DECIMAL,
    stock_quantity  INT,
    rarity          TEXT,
    set_name        TEXT,
    card_number     TEXT,
    image_url       TEXT,
    is_available    BOOLEAN,
    created_at      TIMESTAMP,
    updated_at      TIMESTAMP

) WITH comment = 'Lookup table: full product row by UUID (denormalized from products)';


-- =============================================================================
-- TABLE 3: orders
-- -----------------------------------------------------------------------------
-- PRIMARY ACCESS PATTERN: "Show all orders for a customer, newest first"
--   SELECT * FROM orders WHERE customer_id = <uuid>;
--
-- Partition key  : customer_id   → all orders for one customer in one partition
-- Clustering key : order_id DESC → newest orders come back first
--                  created_at    → secondary sort for tie-breaking
-- =============================================================================

CREATE TABLE IF NOT EXISTS trading_card_shop.orders (

    -- ── Partition key ────────────────────────────────────────────────────────
    customer_id     UUID,

    -- ── Clustering keys ──────────────────────────────────────────────────────
    order_id        UUID,
    created_at      TIMESTAMP,

    -- ── Order-level data ──────────────────────────────────────────────────────
    status          TEXT,       -- 'pending' | 'confirmed' | 'shipped' | 'delivered' | 'cancelled'
    total_amount    DECIMAL,    -- THB total (sum of all line items)
    shipping_name   TEXT,
    shipping_address TEXT,
    payment_method  TEXT,       -- 'credit_card' | 'promptpay' | 'bank_transfer' | 'cod'
    notes           TEXT,
    updated_at      TIMESTAMP,

    PRIMARY KEY ( customer_id, order_id, created_at )

) WITH CLUSTERING ORDER BY ( order_id DESC, created_at DESC )
  AND comment = 'Customer orders — newest first per customer';


-- =============================================================================
-- TABLE 4: order_items
-- -----------------------------------------------------------------------------
-- PRIMARY ACCESS PATTERN: "Show all line items for a specific order"
--   SELECT * FROM order_items WHERE order_id = <uuid>;
--
-- Partition key  : order_id       → all items of one order in one partition
-- Clustering key : product_id     → one row per product within that order
-- =============================================================================

CREATE TABLE IF NOT EXISTS trading_card_shop.order_items (

    -- ── Partition key ────────────────────────────────────────────────────────
    order_id        UUID,

    -- ── Clustering key ───────────────────────────────────────────────────────
    product_id      UUID,

    -- ── Denormalized snapshot of product at time of purchase ─────────────────
    -- We COPY these from products so the order record is immutable even if
    -- the product name / price changes later.
    product_name    TEXT,
    category        TEXT,
    subcategory     TEXT,
    quantity        INT,
    unit_price      DECIMAL,    -- price per unit at time of order (THB)
    line_total      DECIMAL,    -- unit_price * quantity (THB)

    PRIMARY KEY ( order_id, product_id )

) WITH comment = 'Line items per order — product snapshot at purchase time';


-- =============================================================================
-- TABLE: products_by_price  (replaces Materialized View)
-- -----------------------------------------------------------------------------
-- ACCESS PATTERN: "Find products within a price range within a category"
--   SELECT * FROM products_by_price
--   WHERE category = 'yugioh' AND price >= 500 AND price <= 2000;
--
-- NOTE: Cassandra 4.x disables Materialized Views by default (materialized_views_enabled=false).
--   This denormalized table is the recommended alternative for dev environments.
--   Populate it alongside products + products_by_id in the seeding layer.
--
-- Partition key  : category         → all products of same brand in one partition
-- Clustering keys: price ASC        → enables efficient range scans on price
--                  subcategory ASC  → secondary sort within same price
--                  product_id ASC   → tie-breaker (UUID ensures uniqueness)
-- =============================================================================

CREATE TABLE IF NOT EXISTS trading_card_shop.products_by_price (

    -- ── Partition key ─────────────────────────────────────────────────────────
    category        TEXT,

    -- ── Clustering keys ───────────────────────────────────────────────────────
    price           DECIMAL,
    subcategory     TEXT,
    product_id      UUID,

    -- ── Denormalized product columns ──────────────────────────────────────────
    name            TEXT,
    description     TEXT,
    stock_quantity  INT,
    rarity          TEXT,
    set_name        TEXT,
    card_number     TEXT,
    image_url       TEXT,
    is_available    BOOLEAN,
    created_at      TIMESTAMP,
    updated_at      TIMESTAMP,

    PRIMARY KEY ( category, price, subcategory, product_id )

) WITH CLUSTERING ORDER BY ( price ASC, subcategory ASC, product_id ASC )
  AND comment = 'Lookup table: price-range queries within a category (replaces disabled MV)';


-- =============================================================================
-- SECONDARY INDEX: products_by_rarity
-- -----------------------------------------------------------------------------
-- For low-cardinality columns like rarity (only ~6 distinct values),
-- a secondary index is acceptable — the result sets per rarity value are
-- still manageable in a dev/small-shop scenario.
--
-- Usage:  SELECT * FROM products WHERE rarity = 'Secret Rare' ALLOW FILTERING;
-- =============================================================================

CREATE INDEX IF NOT EXISTS idx_products_rarity
    ON trading_card_shop.products (rarity);

CREATE INDEX IF NOT EXISTS idx_products_available
    ON trading_card_shop.products (is_available);

-- =============================================================================
-- TABLE 5: users
-- -----------------------------------------------------------------------------
-- Stores user accounts for authentication
-- =============================================================================

CREATE TABLE IF NOT EXISTS trading_card_shop.users (
    user_id       UUID,
    username      TEXT,
    email         TEXT,
    password_hash TEXT,
    display_name  TEXT,
    created_at    TIMESTAMP,
    PRIMARY KEY (username)
) WITH comment = 'User accounts for authentication';
