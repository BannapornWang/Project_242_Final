CREATE KEYSPACE IF NOT EXISTS trading_card_shop
WITH replication = {'class': 'SimpleStrategy', 'replication_factor': 1};

USE trading_card_shop;

CREATE TABLE IF NOT EXISTS products (
    category text,
    subcategory text,
    product_id uuid,
    name text,
    description text,
    price double,
    stock_quantity int,
    rarity text,
    set_name text,
    card_number text,
    image_url text,
    is_available boolean,
    created_at timestamp,
    updated_at timestamp,
    PRIMARY KEY ((category, subcategory), product_id)
);

CREATE TABLE IF NOT EXISTS products_by_id (
    product_id uuid PRIMARY KEY,
    category text,
    subcategory text,
    name text,
    description text,
    price double,
    stock_quantity int,
    rarity text,
    set_name text,
    card_number text,
    image_url text,
    is_available boolean,
    created_at timestamp,
    updated_at timestamp
);
