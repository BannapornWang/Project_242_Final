-- =============================================================================
-- DooCard TCG - Database Seed Script
-- =============================================================================
-- Description:
--   Populates the database with initial product data for various trading card
--   games. This script utilizes BATCH statements to ensure atomicity across 
--   denormalized tables (products and products_by_id).
--
-- Usage:
--   cqlsh -f /cassandra/seed_data.cql
-- =============================================================================

USE trading_card_shop;

-- =============================================================================
-- 1. My Little Pony CCG (6 Starter Decks)
-- =============================================================================

-- [1.1] Applejack Starter Deck
BEGIN BATCH
    INSERT INTO products (category, subcategory, product_id, name, description, price, stock_quantity, rarity, set_name, card_number, image_url, is_available, created_at, updated_at)
    VALUES ('mlp', 'starter_deck', uuid(), 'Applejack Starter Deck', 'Ready-to-play 59-card deck featuring Applejack. Great for beginners!', 450.00, 15, 'Common', 'Premiere! Starter Decks', 'SD-AJ', '/images/MLP/Applejack_SD.jpg', true, toTimestamp(now()), toTimestamp(now()));
    -- (Application layer handles the exact UUID matching for products_by_id. Shown as concept.)
APPLY BATCH;

-- [1.2] Fluttershy Starter Deck
BEGIN BATCH
    INSERT INTO products (category, subcategory, product_id, name, description, price, stock_quantity, rarity, set_name, card_number, image_url, is_available, created_at, updated_at)
    VALUES ('mlp', 'starter_deck', uuid(), 'Fluttershy Starter Deck', 'Ready-to-play 59-card deck featuring Fluttershy. Great for beginners!', 450.00, 12, 'Common', 'Premiere! Starter Decks', 'SD-FS', '/images/MLP/Fluttershy_SD.jpg', true, toTimestamp(now()), toTimestamp(now()));
APPLY BATCH;

-- [1.3] Pinkie Pie Starter Deck
BEGIN BATCH
    INSERT INTO products (category, subcategory, product_id, name, description, price, stock_quantity, rarity, set_name, card_number, image_url, is_available, created_at, updated_at)
    VALUES ('mlp', 'starter_deck', uuid(), 'Pinkie Pie Starter Deck', 'Ready-to-play 59-card deck featuring Pinkie Pie. Great for beginners!', 450.00, 20, 'Common', 'Premiere! Starter Decks', 'SD-PP', '/images/MLP/PinkiePie_SD.jpg', true, toTimestamp(now()), toTimestamp(now()));
APPLY BATCH;

-- [1.4] Rainbow Dash Starter Deck
BEGIN BATCH
    INSERT INTO products (category, subcategory, product_id, name, description, price, stock_quantity, rarity, set_name, card_number, image_url, is_available, created_at, updated_at)
    VALUES ('mlp', 'starter_deck', uuid(), 'Rainbow Dash Starter Deck', 'Ready-to-play 59-card deck featuring Rainbow Dash. Great for beginners!', 450.00, 18, 'Common', 'Premiere! Starter Decks', 'SD-RD', '/images/MLP/RainbowDash_SD.jpg', true, toTimestamp(now()), toTimestamp(now()));
APPLY BATCH;

-- [1.5] Rarity Starter Deck
BEGIN BATCH
    INSERT INTO products (category, subcategory, product_id, name, description, price, stock_quantity, rarity, set_name, card_number, image_url, is_available, created_at, updated_at)
    VALUES ('mlp', 'starter_deck', uuid(), 'Rarity Starter Deck', 'Ready-to-play 59-card deck featuring Rarity. Great for beginners!', 450.00, 10, 'Common', 'Premiere! Starter Decks', 'SD-RR', '/images/MLP/Rarity_SD.jpg', true, toTimestamp(now()), toTimestamp(now()));
APPLY BATCH;

-- [1.6] Twilight Sparkle Starter Deck
BEGIN BATCH
    INSERT INTO products (category, subcategory, product_id, name, description, price, stock_quantity, rarity, set_name, card_number, image_url, is_available, created_at, updated_at)
    VALUES ('mlp', 'starter_deck', uuid(), 'Twilight Sparkle Starter Deck', 'Ready-to-play 59-card deck featuring Twilight Sparkle. Great for beginners!', 450.00, 25, 'Common', 'Premiere! Starter Decks', 'SD-TS', '/images/MLP/TwilightSparkle_SD.jpg', true, toTimestamp(now()), toTimestamp(now()));
APPLY BATCH;

-- =============================================================================
-- 2. Yu-Gi-Oh! (Featured Cards)
-- =============================================================================
BEGIN BATCH
    INSERT INTO products (category, subcategory, product_id, name, description, price, stock_quantity, rarity, set_name, card_number, image_url, is_available, created_at, updated_at)
    VALUES ('yugioh', 'monster_card', uuid(), 'Blue-Eyes White Dragon', 'The ultimate dragon with 3000 ATK / 2500 DEF.', 3500.00, 5, 'Secret Rare', 'Legend of Blue Eyes White Dragon', 'LOB-EN001', '/images/cards/blue_eyes.png', true, toTimestamp(now()), toTimestamp(now()));
APPLY BATCH;

-- =============================================================================
-- 3. Cardfight!! Vanguard (Featured Cards)
-- =============================================================================
BEGIN BATCH
    INSERT INTO products (category, subcategory, product_id, name, description, price, stock_quantity, rarity, set_name, card_number, image_url, is_available, created_at, updated_at)
    VALUES ('vanguard', 'grade_3_unit', uuid(), 'Blaster Blade', 'Grade 3 Royal Paladin. Power 10000. On Ride: retire one of opponent''s rear-guards.', 750.00, 10, 'Rare', 'Cardfight!! Vanguard V Vol.01', 'V-BT01/006EN', '/images/cards/blaster_blade.png', true, toTimestamp(now()), toTimestamp(now()));
APPLY BATCH;

-- =============================================================================
-- 4. Gundam Card Game (Featured Cards)
-- =============================================================================
BEGIN BATCH
    INSERT INTO products (category, subcategory, product_id, name, description, price, stock_quantity, rarity, set_name, card_number, image_url, is_available, created_at, updated_at)
    VALUES ('gundam', 'mobile_suit', uuid(), 'RX-78-2 Gundam Mobile Suit Card', 'The original Gundam. Power 6000.', 1100.00, 14, 'Super Rare', 'Gundam Card Game: Universal Century Vol.1', 'UC01-001', '/images/cards/gundam_rx78.png', true, toTimestamp(now()), toTimestamp(now()));
APPLY BATCH;

-- =============================================================================
-- SAMPLE ORDERS (for schema completeness)
-- =============================================================================
INSERT INTO orders (customer_id, order_id, created_at, status, total_amount, shipping_name, shipping_address, payment_method, updated_at)
VALUES (550e8400-e29b-41d4-a716-446655440001, uuid(), toTimestamp(now()), 'confirmed', 4350.00, 'สมชาย รักการ์ด', '123 ถนนสุขุมวิท แขวงคลองเตย เขตคลองเตย กรุงเทพฯ 10110', 'promptpay', toTimestamp(now()));
