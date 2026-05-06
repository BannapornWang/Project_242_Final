USE trading_card_shop;

-- =============================================================================
-- 2. Gundam Card Game (10 Starter Decks ST01-ST10)
-- =============================================================================

-- [2.1] Generation Pulse Starter Deck [ST10]
BEGIN BATCH
    INSERT INTO products (category, subcategory, product_id, name, description, price, stock_quantity, rarity, set_name, card_number, image_url, is_available, created_at, updated_at)
    VALUES ('gundam', 'starter_deck', 22222222-2222-2222-2222-222222222210, 'Generation Pulse Starter Deck', 'Ready-to-play Gundam Card Game Starter Deck [ST10].', 550.00, 10, 'Common', 'Gundam Starter Decks', 'ST10', '/images/GUNDUM/Generation Pulse [ST10].png', true, toTimestamp(now()), toTimestamp(now()));

    INSERT INTO products_by_id (product_id, category, subcategory, name, description, price, stock_quantity, rarity, set_name, card_number, image_url, is_available, created_at, updated_at)
    VALUES (22222222-2222-2222-2222-222222222210, 'gundam', 'starter_deck', 'Generation Pulse Starter Deck', 'Ready-to-play Gundam Card Game Starter Deck [ST10].', 550.00, 10, 'Common', 'Gundam Starter Decks', 'ST10', '/images/GUNDUM/Generation Pulse [ST10].png', true, toTimestamp(now()), toTimestamp(now()));
APPLY BATCH;

-- [2.2] Destiny Ignition Starter Deck [ST09]
BEGIN BATCH
    INSERT INTO products (category, subcategory, product_id, name, description, price, stock_quantity, rarity, set_name, card_number, image_url, is_available, created_at, updated_at)
    VALUES ('gundam', 'starter_deck', 22222222-2222-2222-2222-222222222209, 'Destiny Ignition Starter Deck', 'Ready-to-play Gundam Card Game Starter Deck [ST09].', 550.00, 10, 'Common', 'Gundam Starter Decks', 'ST09', '/images/GUNDUM/Destiny Ignition [ST09].png', true, toTimestamp(now()), toTimestamp(now()));

    INSERT INTO products_by_id (product_id, category, subcategory, name, description, price, stock_quantity, rarity, set_name, card_number, image_url, is_available, created_at, updated_at)
    VALUES (22222222-2222-2222-2222-222222222209, 'gundam', 'starter_deck', 'Destiny Ignition Starter Deck', 'Ready-to-play Gundam Card Game Starter Deck [ST09].', 550.00, 10, 'Common', 'Gundam Starter Decks', 'ST09', '/images/GUNDUM/Destiny Ignition [ST09].png', true, toTimestamp(now()), toTimestamp(now()));
APPLY BATCH;

-- [2.3] Flash of Radiance Starter Deck [ST08]
BEGIN BATCH
    INSERT INTO products (category, subcategory, product_id, name, description, price, stock_quantity, rarity, set_name, card_number, image_url, is_available, created_at, updated_at)
    VALUES ('gundam', 'starter_deck', 22222222-2222-2222-2222-222222222208, 'Flash of Radiance Starter Deck', 'Ready-to-play Gundam Card Game Starter Deck [ST08].', 550.00, 10, 'Common', 'Gundam Starter Decks', 'ST08', '/images/GUNDUM/Flash of Radiance [ST08].png', true, toTimestamp(now()), toTimestamp(now()));

    INSERT INTO products_by_id (product_id, category, subcategory, name, description, price, stock_quantity, rarity, set_name, card_number, image_url, is_available, created_at, updated_at)
    VALUES (22222222-2222-2222-2222-222222222208, 'gundam', 'starter_deck', 'Flash of Radiance Starter Deck', 'Ready-to-play Gundam Card Game Starter Deck [ST08].', 550.00, 10, 'Common', 'Gundam Starter Decks', 'ST08', '/images/GUNDUM/Flash of Radiance [ST08].png', true, toTimestamp(now()), toTimestamp(now()));
APPLY BATCH;

-- [2.4] Celestial Drive Starter Deck [ST07]
BEGIN BATCH
    INSERT INTO products (category, subcategory, product_id, name, description, price, stock_quantity, rarity, set_name, card_number, image_url, is_available, created_at, updated_at)
    VALUES ('gundam', 'starter_deck', 22222222-2222-2222-2222-222222222207, 'Celestial Drive Starter Deck', 'Ready-to-play Gundam Card Game Starter Deck [ST07].', 550.00, 10, 'Common', 'Gundam Starter Decks', 'ST07', '/images/GUNDUM/Celestial Drive [ST07].png', true, toTimestamp(now()), toTimestamp(now()));

    INSERT INTO products_by_id (product_id, category, subcategory, name, description, price, stock_quantity, rarity, set_name, card_number, image_url, is_available, created_at, updated_at)
    VALUES (22222222-2222-2222-2222-222222222207, 'gundam', 'starter_deck', 'Celestial Drive Starter Deck', 'Ready-to-play Gundam Card Game Starter Deck [ST07].', 550.00, 10, 'Common', 'Gundam Starter Decks', 'ST07', '/images/GUNDUM/Celestial Drive [ST07].png', true, toTimestamp(now()), toTimestamp(now()));
APPLY BATCH;

-- [2.5] Clan Unity Starter Deck [ST06]
BEGIN BATCH
    INSERT INTO products (category, subcategory, product_id, name, description, price, stock_quantity, rarity, set_name, card_number, image_url, is_available, created_at, updated_at)
    VALUES ('gundam', 'starter_deck', 22222222-2222-2222-2222-222222222206, 'Clan Unity Starter Deck', 'Ready-to-play Gundam Card Game Starter Deck [ST06].', 550.00, 10, 'Common', 'Gundam Starter Decks', 'ST06', '/images/GUNDUM/Clan Unity [ST06].png', true, toTimestamp(now()), toTimestamp(now()));

    INSERT INTO products_by_id (product_id, category, subcategory, name, description, price, stock_quantity, rarity, set_name, card_number, image_url, is_available, created_at, updated_at)
    VALUES (22222222-2222-2222-2222-222222222206, 'gundam', 'starter_deck', 'Clan Unity Starter Deck', 'Ready-to-play Gundam Card Game Starter Deck [ST06].', 550.00, 10, 'Common', 'Gundam Starter Decks', 'ST06', '/images/GUNDUM/Clan Unity [ST06].png', true, toTimestamp(now()), toTimestamp(now()));
APPLY BATCH;

-- [2.6] Iron Bloom Starter Deck [ST05]
BEGIN BATCH
    INSERT INTO products (category, subcategory, product_id, name, description, price, stock_quantity, rarity, set_name, card_number, image_url, is_available, created_at, updated_at)
    VALUES ('gundam', 'starter_deck', 22222222-2222-2222-2222-222222222205, 'Iron Bloom Starter Deck', 'Ready-to-play Gundam Card Game Starter Deck [ST05].', 550.00, 10, 'Common', 'Gundam Starter Decks', 'ST05', '/images/GUNDUM/Iron Bloom [ST05].png', true, toTimestamp(now()), toTimestamp(now()));

    INSERT INTO products_by_id (product_id, category, subcategory, name, description, price, stock_quantity, rarity, set_name, card_number, image_url, is_available, created_at, updated_at)
    VALUES (22222222-2222-2222-2222-222222222205, 'gundam', 'starter_deck', 'Iron Bloom Starter Deck', 'Ready-to-play Gundam Card Game Starter Deck [ST05].', 550.00, 10, 'Common', 'Gundam Starter Decks', 'ST05', '/images/GUNDUM/Iron Bloom [ST05].png', true, toTimestamp(now()), toTimestamp(now()));
APPLY BATCH;

-- [2.7] SEED Strike Starter Deck [ST04]
BEGIN BATCH
    INSERT INTO products (category, subcategory, product_id, name, description, price, stock_quantity, rarity, set_name, card_number, image_url, is_available, created_at, updated_at)
    VALUES ('gundam', 'starter_deck', 22222222-2222-2222-2222-222222222204, 'SEED Strike Starter Deck', 'Ready-to-play Gundam Card Game Starter Deck [ST04].', 550.00, 10, 'Common', 'Gundam Starter Decks', 'ST04', '/images/GUNDUM/SEED Strike [ST04].png', true, toTimestamp(now()), toTimestamp(now()));

    INSERT INTO products_by_id (product_id, category, subcategory, name, description, price, stock_quantity, rarity, set_name, card_number, image_url, is_available, created_at, updated_at)
    VALUES (22222222-2222-2222-2222-222222222204, 'gundam', 'starter_deck', 'SEED Strike Starter Deck', 'Ready-to-play Gundam Card Game Starter Deck [ST04].', 550.00, 10, 'Common', 'Gundam Starter Decks', 'ST04', '/images/GUNDUM/SEED Strike [ST04].png', true, toTimestamp(now()), toTimestamp(now()));
APPLY BATCH;

-- [2.8] Zeon's Rush Starter Deck [ST03]
BEGIN BATCH
    INSERT INTO products (category, subcategory, product_id, name, description, price, stock_quantity, rarity, set_name, card_number, image_url, is_available, created_at, updated_at)
    VALUES ('gundam', 'starter_deck', 22222222-2222-2222-2222-222222222203, 'Zeon''s Rush Starter Deck', 'Ready-to-play Gundam Card Game Starter Deck [ST03].', 550.00, 10, 'Common', 'Gundam Starter Decks', 'ST03', '/images/GUNDUM/Zeon''s Rush [ST03].png', true, toTimestamp(now()), toTimestamp(now()));

    INSERT INTO products_by_id (product_id, category, subcategory, name, description, price, stock_quantity, rarity, set_name, card_number, image_url, is_available, created_at, updated_at)
    VALUES (22222222-2222-2222-2222-222222222203, 'gundam', 'starter_deck', 'Zeon''s Rush Starter Deck', 'Ready-to-play Gundam Card Game Starter Deck [ST03].', 550.00, 10, 'Common', 'Gundam Starter Decks', 'ST03', '/images/GUNDUM/Zeon''s Rush [ST03].png', true, toTimestamp(now()), toTimestamp(now()));
APPLY BATCH;

-- [2.9] Wings of Advance Starter Deck [ST02]
BEGIN BATCH
    INSERT INTO products (category, subcategory, product_id, name, description, price, stock_quantity, rarity, set_name, card_number, image_url, is_available, created_at, updated_at)
    VALUES ('gundam', 'starter_deck', 22222222-2222-2222-2222-222222222202, 'Wings of Advance Starter Deck', 'Ready-to-play Gundam Card Game Starter Deck [ST02].', 550.00, 10, 'Common', 'Gundam Starter Decks', 'ST02', '/images/GUNDUM/Wings of Advance [ST02].png', true, toTimestamp(now()), toTimestamp(now()));

    INSERT INTO products_by_id (product_id, category, subcategory, name, description, price, stock_quantity, rarity, set_name, card_number, image_url, is_available, created_at, updated_at)
    VALUES (22222222-2222-2222-2222-222222222202, 'gundam', 'starter_deck', 'Wings of Advance Starter Deck', 'Ready-to-play Gundam Card Game Starter Deck [ST02].', 550.00, 10, 'Common', 'Gundam Starter Decks', 'ST02', '/images/GUNDUM/Wings of Advance [ST02].png', true, toTimestamp(now()), toTimestamp(now()));
APPLY BATCH;

-- [2.10] Heroic Beginnings Starter Deck [ST01]
BEGIN BATCH
    INSERT INTO products (category, subcategory, product_id, name, description, price, stock_quantity, rarity, set_name, card_number, image_url, is_available, created_at, updated_at)
    VALUES ('gundam', 'starter_deck', 22222222-2222-2222-2222-222222222201, 'Heroic Beginnings Starter Deck', 'Ready-to-play Gundam Card Game Starter Deck [ST01].', 550.00, 10, 'Common', 'Gundam Starter Decks', 'ST01', '/images/GUNDUM/Heroic Beginnings [ST01].png', true, toTimestamp(now()), toTimestamp(now()));

    INSERT INTO products_by_id (product_id, category, subcategory, name, description, price, stock_quantity, rarity, set_name, card_number, image_url, is_available, created_at, updated_at)
    VALUES (22222222-2222-2222-2222-222222222201, 'gundam', 'starter_deck', 'Heroic Beginnings Starter Deck', 'Ready-to-play Gundam Card Game Starter Deck [ST01].', 550.00, 10, 'Common', 'Gundam Starter Decks', 'ST01', '/images/GUNDUM/Heroic Beginnings [ST01].png', true, toTimestamp(now()), toTimestamp(now()));
APPLY BATCH;
