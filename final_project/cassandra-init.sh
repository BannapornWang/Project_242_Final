#!/bin/bash
# =============================================================================
# cassandra-init.sh
# Initialize Cassandra keyspace for Trading Card Game Shop
#
# Usage (run INSIDE the cassandra-node container):
#   docker exec cassandra-node bash /cassandra-init.sh
#
# Or copy into container and run:
#   docker cp cassandra-init.sh cassandra-node:/cassandra-init.sh
#   docker exec cassandra-node bash /cassandra-init.sh
# =============================================================================

set -e  # Exit immediately on any error

# -----------------------------------------------------------------------------
# Configuration
# -----------------------------------------------------------------------------
CASSANDRA_HOST="${CASSANDRA_HOST:-127.0.0.1}"
CASSANDRA_PORT="${CASSANDRA_PORT:-9042}"
KEYSPACE="trading_card_shop"
REPLICATION_FACTOR=1
MAX_RETRIES=30
RETRY_INTERVAL=5   # seconds between retries

echo "=============================================="
echo "  TCG Shop — Cassandra Initialization Script"
echo "  Host: ${CASSANDRA_HOST}:${CASSANDRA_PORT}"
echo "=============================================="

# -----------------------------------------------------------------------------
# STEP 1: Wait for Cassandra to be ready
# Retry loop — cqlsh exits non-zero if Cassandra isn't ready yet
# -----------------------------------------------------------------------------
echo ""
echo "[1/3] Waiting for Cassandra to be ready..."
echo "      (Max retries: ${MAX_RETRIES}, interval: ${RETRY_INTERVAL}s)"
echo ""

RETRY_COUNT=0

until cqlsh "${CASSANDRA_HOST}" "${CASSANDRA_PORT}" -e "DESCRIBE KEYSPACES;" > /dev/null 2>&1; do
  RETRY_COUNT=$((RETRY_COUNT + 1))

  if [ "${RETRY_COUNT}" -ge "${MAX_RETRIES}" ]; then
    echo "ERROR: Cassandra did not become ready after ${MAX_RETRIES} attempts."
    echo "       Check: docker logs cassandra-node"
    exit 1
  fi

  echo "  Attempt ${RETRY_COUNT}/${MAX_RETRIES} — Cassandra not ready yet. Retrying in ${RETRY_INTERVAL}s..."
  sleep "${RETRY_INTERVAL}"
done

echo ""
echo "  ✓ Cassandra is UP and accepting connections!"
echo ""

# EXPECTED terminal output during wait loop:
#   Attempt 1/30 — Cassandra not ready yet. Retrying in 5s...
#   Attempt 2/30 — Cassandra not ready yet. Retrying in 5s...
#   ...
#   ✓ Cassandra is UP and accepting connections!

# -----------------------------------------------------------------------------
# STEP 2: Create the keyspace
# SimpleStrategy is appropriate for single-datacenter / dev deployments
# NetworkTopologyStrategy should be used in multi-DC production setups
# -----------------------------------------------------------------------------
echo "[2/3] Creating keyspace: '${KEYSPACE}'..."
echo ""

cqlsh "${CASSANDRA_HOST}" "${CASSANDRA_PORT}" <<EOF
-- Create keyspace with SimpleStrategy (single node / single DC dev setup)
CREATE KEYSPACE IF NOT EXISTS ${KEYSPACE}
  WITH replication = {
    'class': 'SimpleStrategy',
    'replication_factor': ${REPLICATION_FACTOR}
  }
  AND durable_writes = true;

-- Switch to the new keyspace and confirm it exists
USE ${KEYSPACE};

-- ============================================================
-- TABLES: Trading Card Game Shop
-- Categories: Yugioh, Vanguard, My Little Pony (MLP), Gundam
-- ============================================================

-- Products table: main catalog of cards/items
CREATE TABLE IF NOT EXISTS ${KEYSPACE}.products (
  category     TEXT,
  subcategory  TEXT,
  product_id   UUID,
  name         TEXT,
  description  TEXT,
  price        DECIMAL,
  stock_quantity INT,
  rarity       TEXT,
  set_name     TEXT,
  card_number  TEXT,
  image_url    TEXT,
  is_available BOOLEAN,
  created_at   TIMESTAMP,
  updated_at   TIMESTAMP,
  PRIMARY KEY ((category, subcategory), product_id)
);

-- Products by ID: lookup table for individual products
CREATE TABLE IF NOT EXISTS ${KEYSPACE}.products_by_id (
  product_id   UUID PRIMARY KEY,
  category     TEXT,
  subcategory  TEXT,
  name         TEXT,
  description  TEXT,
  price        DECIMAL,
  stock_quantity INT,
  rarity       TEXT,
  set_name     TEXT,
  card_number  TEXT,
  image_url    TEXT,
  is_available BOOLEAN,
  created_at   TIMESTAMP,
  updated_at   TIMESTAMP
);

-- Orders table: customer orders
CREATE TABLE IF NOT EXISTS ${KEYSPACE}.orders (
  order_id     UUID PRIMARY KEY,
  customer_id  UUID,
  status       TEXT,          -- 'pending' | 'paid' | 'shipped' | 'delivered'
  total        DECIMAL,
  created_at   TIMESTAMP
);

-- Order items: line items within each order
CREATE TABLE IF NOT EXISTS ${KEYSPACE}.order_items (
  order_id    UUID,
  product_id  UUID,
  quantity    INT,
  unit_price  DECIMAL,
  PRIMARY KEY (order_id, product_id)
);

DESCRIBE KEYSPACE ${KEYSPACE};
EOF

echo ""
echo "  ✓ Keyspace '${KEYSPACE}' created successfully!"
echo ""

# EXPECTED terminal output:
#   CREATE KEYSPACE trading_card_shop ...
#   ✓ Keyspace 'trading_card_shop' created successfully!

# -----------------------------------------------------------------------------
# STEP 3: Verification — confirm keyspace and tables exist
# -----------------------------------------------------------------------------
echo "[3/3] Verifying setup with cqlsh..."
echo ""

cqlsh "${CASSANDRA_HOST}" "${CASSANDRA_PORT}" <<'VERIFY'
-- List all keyspaces — 'trading_card_shop' should appear in the list
DESCRIBE KEYSPACES;

-- Verify tables inside the keyspace
USE trading_card_shop;
DESCRIBE TABLES;
VERIFY

echo ""
# -----------------------------------------------------------------------------
# STEP 4: Import Seed Data
# Automatically import all .cql files found in /cassandra
# -----------------------------------------------------------------------------
if [ -d "/cassandra" ]; then
  echo "[4/4] Importing seed data from /cassandra..."
  echo ""
  
  # Set keyspace for the session
  export CQLSH_HOST="${CASSANDRA_HOST}"
  export CQLSH_PORT="${CASSANDRA_PORT}"
  
  for f in /cassandra/seed_*.cql; do
    if [ -f "$f" ]; then
      echo "  -> Importing: $(basename "$f")..."
      cqlsh "${CASSANDRA_HOST}" "${CASSANDRA_PORT}" -k "${KEYSPACE}" -f "$f" > /dev/null
    fi
  done
  
  echo ""
  echo "  ✓ Seed data imported successfully!"
  echo ""
else
  echo "[4/4] No /cassandra directory found, skipping seed import."
fi

echo "=============================================="
echo "  ✓ Cassandra initialization COMPLETE!"
echo "  Keyspace  : trading_card_shop"
echo "  Tables    : products, products_by_id"
echo "  Strategy  : SimpleStrategy (RF=1)"
echo "=============================================="
echo ""

# EXPECTED FINAL OUTPUT:
#
#   Keyspace                    | Replication | Strategy
#   ----------------------------+-------------+----------
#   trading_card_shop           | ...         | SimpleStrategy
#
#   Tables in trading_card_shop:
#     products
#     products_by_id
#
#   ==============================================
#   ✓ Cassandra initialization COMPLETE!
#   Keyspace  : trading_card_shop
#   Tables    : products, products_by_id
#   Strategy  : SimpleStrategy (RF=1)
#   ==============================================