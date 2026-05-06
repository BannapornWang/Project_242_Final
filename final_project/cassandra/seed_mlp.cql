USE trading_card_shop;

-- =============================================================================
-- 1. My Little Pony CCG (6 Starter Decks)
-- =============================================================================

-- [1.1] Applejack Starter Deck
BEGIN BATCH
    INSERT INTO products (category, subcategory, product_id, name, description, price, stock_quantity, rarity, set_name, card_number, image_url, is_available, created_at, updated_at)
    VALUES ('mlp', 'starter_deck', 11111111-1111-1111-1111-111111111111, 'Applejack Starter Deck', 'Ready-to-play 59-card deck featuring Applejack. Great for beginners!', 450.00, 15, 'Common', 'Premiere! Starter Decks', 'SD-AJ', '/images/MLP/Applejack_SD.jpg', true, toTimestamp(now()), toTimestamp(now()));
    
    INSERT INTO products_by_id (product_id, category, subcategory, name, description, price, stock_quantity, rarity, set_name, card_number, image_url, is_available, created_at, updated_at)
    VALUES (11111111-1111-1111-1111-111111111111, 'mlp', 'starter_deck', 'Applejack Starter Deck', 'Ready-to-play 59-card deck featuring Applejack. Great for beginners!', 450.00, 15, 'Common', 'Premiere! Starter Decks', 'SD-AJ', '/images/MLP/Applejack_SD.jpg', true, toTimestamp(now()), toTimestamp(now()));
APPLY BATCH;

-- [1.2] Fluttershy Starter Deck
BEGIN BATCH
    INSERT INTO products (category, subcategory, product_id, name, description, price, stock_quantity, rarity, set_name, card_number, image_url, is_available, created_at, updated_at)
    VALUES ('mlp', 'starter_deck', 11111111-1111-1111-1111-111111111112, 'Fluttershy Starter Deck', 'Ready-to-play 59-card deck featuring Fluttershy. Great for beginners!', 450.00, 12, 'Common', 'Premiere! Starter Decks', 'SD-FS', '/images/MLP/Fluttershy_SD.jpg', true, toTimestamp(now()), toTimestamp(now()));

    INSERT INTO products_by_id (product_id, category, subcategory, name, description, price, stock_quantity, rarity, set_name, card_number, image_url, is_available, created_at, updated_at)
    VALUES (11111111-1111-1111-1111-111111111112, 'mlp', 'starter_deck', 'Fluttershy Starter Deck', 'Ready-to-play 59-card deck featuring Fluttershy. Great for beginners!', 450.00, 12, 'Common', 'Premiere! Starter Decks', 'SD-FS', '/images/MLP/Fluttershy_SD.jpg', true, toTimestamp(now()), toTimestamp(now()));
APPLY BATCH;

-- [1.3] Pinkie Pie Starter Deck
BEGIN BATCH
    INSERT INTO products (category, subcategory, product_id, name, description, price, stock_quantity, rarity, set_name, card_number, image_url, is_available, created_at, updated_at)
    VALUES ('mlp', 'starter_deck', 11111111-1111-1111-1111-111111111113, 'Pinkie Pie Starter Deck', 'Ready-to-play 59-card deck featuring Pinkie Pie. Great for beginners!', 450.00, 20, 'Common', 'Premiere! Starter Decks', 'SD-PP', '/images/MLP/PinkiePie_SD.jpg', true, toTimestamp(now()), toTimestamp(now()));

    INSERT INTO products_by_id (product_id, category, subcategory, name, description, price, stock_quantity, rarity, set_name, card_number, image_url, is_available, created_at, updated_at)
    VALUES (11111111-1111-1111-1111-111111111113, 'mlp', 'starter_deck', 'Pinkie Pie Starter Deck', 'Ready-to-play 59-card deck featuring Pinkie Pie. Great for beginners!', 450.00, 20, 'Common', 'Premiere! Starter Decks', 'SD-PP', '/images/MLP/PinkiePie_SD.jpg', true, toTimestamp(now()), toTimestamp(now()));
APPLY BATCH;

-- [1.4] Rainbow Dash Starter Deck
BEGIN BATCH
    INSERT INTO products (category, subcategory, product_id, name, description, price, stock_quantity, rarity, set_name, card_number, image_url, is_available, created_at, updated_at)
    VALUES ('mlp', 'starter_deck', 11111111-1111-1111-1111-111111111114, 'Rainbow Dash Starter Deck', 'Ready-to-play 59-card deck featuring Rainbow Dash. Great for beginners!', 450.00, 18, 'Common', 'Premiere! Starter Decks', 'SD-RD', '/images/MLP/RainbowDash_SD.jpg', true, toTimestamp(now()), toTimestamp(now()));

    INSERT INTO products_by_id (product_id, category, subcategory, name, description, price, stock_quantity, rarity, set_name, card_number, image_url, is_available, created_at, updated_at)
    VALUES (11111111-1111-1111-1111-111111111114, 'mlp', 'starter_deck', 'Rainbow Dash Starter Deck', 'Ready-to-play 59-card deck featuring Rainbow Dash. Great for beginners!', 450.00, 18, 'Common', 'Premiere! Starter Decks', 'SD-RD', '/images/MLP/RainbowDash_SD.jpg', true, toTimestamp(now()), toTimestamp(now()));
APPLY BATCH;

-- [1.5] Rarity Starter Deck
BEGIN BATCH
    INSERT INTO products (category, subcategory, product_id, name, description, price, stock_quantity, rarity, set_name, card_number, image_url, is_available, created_at, updated_at)
    VALUES ('mlp', 'starter_deck', 11111111-1111-1111-1111-111111111115, 'Rarity Starter Deck', 'Ready-to-play 59-card deck featuring Rarity. Great for beginners!', 450.00, 10, 'Common', 'Premiere! Starter Decks', 'SD-RR', '/images/MLP/Rarity_SD.jpg', true, toTimestamp(now()), toTimestamp(now()));

    INSERT INTO products_by_id (product_id, category, subcategory, name, description, price, stock_quantity, rarity, set_name, card_number, image_url, is_available, created_at, updated_at)
    VALUES (11111111-1111-1111-1111-111111111115, 'mlp', 'starter_deck', 'Rarity Starter Deck', 'Ready-to-play 59-card deck featuring Rarity. Great for beginners!', 450.00, 10, 'Common', 'Premiere! Starter Decks', 'SD-RR', '/images/MLP/Rarity_SD.jpg', true, toTimestamp(now()), toTimestamp(now()));
APPLY BATCH;

-- [1.6] Twilight Sparkle Starter Deck
BEGIN BATCH
    INSERT INTO products (category, subcategory, product_id, name, description, price, stock_quantity, rarity, set_name, card_number, image_url, is_available, created_at, updated_at)
    VALUES ('mlp', 'starter_deck', 11111111-1111-1111-1111-111111111116, 'Twilight Sparkle Starter Deck', 'Ready-to-play 59-card deck featuring Twilight Sparkle. Great for beginners!', 450.00, 25, 'Common', 'Premiere! Starter Decks', 'SD-TS', '/images/MLP/TwilightSparkle_SD.jpg', true, toTimestamp(now()), toTimestamp(now()));

    INSERT INTO products_by_id (product_id, category, subcategory, name, description, price, stock_quantity, rarity, set_name, card_number, image_url, is_available, created_at, updated_at)
    VALUES (11111111-1111-1111-1111-111111111116, 'mlp', 'starter_deck', 'Twilight Sparkle Starter Deck', 'Ready-to-play 59-card deck featuring Twilight Sparkle. Great for beginners!', 450.00, 25, 'Common', 'Premiere! Starter Decks', 'SD-TS', '/images/MLP/TwilightSparkle_SD.jpg', true, toTimestamp(now()), toTimestamp(now()));
APPLY BATCH;
