-- =============================================================================
-- seed_data.cql  —  15 Sample INSERT statements (Thai Baht pricing)
-- Trading Card Game Shop: Yugioh | Vanguard | MLP | Gundam
-- =============================================================================
-- Run after schema.cql:
--   docker exec -it cassandra-node cqlsh -f /cassandra/seed_data.cql
-- =============================================================================

USE trading_card_shop;

-- =============================================================================
-- YUGIOH (5 rows) — subcategories: monster_card, spell_card, booster_pack,
--                                   extra_deck, structure_deck
-- =============================================================================

-- [1] Yugioh Monster Card — Blue-Eyes White Dragon (Secret Rare)
INSERT INTO products (category, subcategory, product_id, name, description,
    price, stock_quantity, rarity, set_name, card_number,
    image_url, is_available, created_at, updated_at)
VALUES (
    'yugioh', 'monster_card', uuid(),
    'Blue-Eyes White Dragon',
    'The ultimate dragon with 3000 ATK / 2500 DEF. A classic must-have for any Yugioh collector.',
    3500.00, 5, 'Secret Rare',
    'Legend of Blue Eyes White Dragon', 'LOB-EN001',
    'https://cdn.tcgshop.th/yugioh/lob-en001.jpg',
    true, toTimestamp(now()), toTimestamp(now())
);

-- [2] Yugioh Spell Card — Monster Reborn (Super Rare)
INSERT INTO products (category, subcategory, product_id, name, description,
    price, stock_quantity, rarity, set_name, card_number,
    image_url, is_available, created_at, updated_at)
VALUES (
    'yugioh', 'spell_card', uuid(),
    'Monster Reborn',
    'Special Summon any monster from either graveyard. One of Yugioh''s most iconic spell cards.',
    850.00, 12, 'Super Rare',
    'Metal Raiders', 'MRD-EN065',
    'https://cdn.tcgshop.th/yugioh/mrd-en065.jpg',
    true, toTimestamp(now()), toTimestamp(now())
);

-- [3] Yugioh Booster Pack — Phantom Nightmare
INSERT INTO products (category, subcategory, product_id, name, description,
    price, stock_quantity, rarity, set_name, card_number,
    image_url, is_available, created_at, updated_at)
VALUES (
    'yugioh', 'booster_pack', uuid(),
    'Phantom Nightmare Booster Pack',
    '9 cards per pack. Introduces new Fiendsmith and Snake-Eye support. Latest 2024 set.',
    180.00, 200, 'Mixed',
    'Phantom Nightmare', 'PHNI-EN',
    'https://cdn.tcgshop.th/yugioh/phni-booster.jpg',
    true, toTimestamp(now()), toTimestamp(now())
);

-- [4] Yugioh Extra Deck — Stardust Dragon (Synchro, Ultra Rare)
INSERT INTO products (category, subcategory, product_id, name, description,
    price, stock_quantity, rarity, set_name, card_number,
    image_url, is_available, created_at, updated_at)
VALUES (
    'yugioh', 'extra_deck', uuid(),
    'Stardust Dragon',
    'Level 8 Synchro. Negate and destroy any card or effect that would destroy a card on the field.',
    1200.00, 8, 'Ultra Rare',
    'The Duelist Genesis', 'TDGS-EN040',
    'https://cdn.tcgshop.th/yugioh/tdgs-en040.jpg',
    true, toTimestamp(now()), toTimestamp(now())
);

-- [5] Yugioh Structure Deck — Dragon's Roar
INSERT INTO products (category, subcategory, product_id, name, description,
    price, stock_quantity, rarity, set_name, card_number,
    image_url, is_available, created_at, updated_at)
VALUES (
    'yugioh', 'structure_deck', uuid(),
    'Structure Deck: Dragon''s Roar',
    'Ready-to-play 40-card deck focused on dragon-type monsters. Includes exclusive cards.',
    490.00, 30, 'Common',
    'Dragon''s Roar Structure Deck', 'SD1-EN',
    'https://cdn.tcgshop.th/yugioh/sd1-structure.jpg',
    true, toTimestamp(now()), toTimestamp(now())
);


-- =============================================================================
-- VANGUARD — Cardfight!! Vanguard (4 rows)
-- subcategories: grade_3_unit, trigger_unit, booster_set, trial_deck
-- =============================================================================

-- [6] Vanguard Grade 3 — Blaster Blade (Royal Paladin)
INSERT INTO products (category, subcategory, product_id, name, description,
    price, stock_quantity, rarity, set_name, card_number,
    image_url, is_available, created_at, updated_at)
VALUES (
    'vanguard', 'grade_3_unit', uuid(),
    'Blaster Blade',
    'Grade 3 Royal Paladin. Power 10000. On Ride: retire one of opponent''s rear-guards.',
    750.00, 10, 'Rare',
    'Cardfight!! Vanguard V Vol.01', 'V-BT01/006EN',
    'https://cdn.tcgshop.th/vanguard/vbt01-006.jpg',
    true, toTimestamp(now()), toTimestamp(now())
);

-- [7] Vanguard Trigger — Bringer of Good Luck, Epona (Critical Trigger)
INSERT INTO products (category, subcategory, product_id, name, description,
    price, stock_quantity, rarity, set_name, card_number,
    image_url, is_available, created_at, updated_at)
VALUES (
    'vanguard', 'trigger_unit', uuid(),
    'Bringer of Good Luck, Epona',
    'Grade 0 Critical Trigger. Power 5000 / Shield 30000. Essential for Royal Paladin builds.',
    220.00, 40, 'Common',
    'V Extra Booster 16', 'V-EB16/030EN',
    'https://cdn.tcgshop.th/vanguard/veb16-030.jpg',
    true, toTimestamp(now()), toTimestamp(now())
);

-- [8] Vanguard Booster Set — V Booster Set 12
INSERT INTO products (category, subcategory, product_id, name, description,
    price, stock_quantity, rarity, set_name, card_number,
    image_url, is_available, created_at, updated_at)
VALUES (
    'vanguard', 'booster_set', uuid(),
    'V Booster Set 12: Divine Lightning Radiance Booster Pack',
    '7 cards per pack. Features Oracle Think Tank and Narukami clans.',
    160.00, 150, 'Mixed',
    'Divine Lightning Radiance', 'V-BT12-EN',
    'https://cdn.tcgshop.th/vanguard/vbt12-booster.jpg',
    true, toTimestamp(now()), toTimestamp(now())
);

-- [9] Vanguard Trial Deck — Royal Paladin Starter Set
INSERT INTO products (category, subcategory, product_id, name, description,
    price, stock_quantity, rarity, set_name, card_number,
    image_url, is_available, created_at, updated_at)
VALUES (
    'vanguard', 'trial_deck', uuid(),
    'Trial Deck: Royal Paladin — Blaster Blade Edition',
    '50-card ready-to-play deck for new players. Includes 2 Royal Paladin RR cards.',
    590.00, 25, 'Common',
    'V Trial Deck 01', 'V-TD01-EN',
    'https://cdn.tcgshop.th/vanguard/vtd01-deck.jpg',
    true, toTimestamp(now()), toTimestamp(now())
);


-- =============================================================================
-- MY LITTLE PONY (MLP) (3 rows)
-- subcategories: mane_character, event_card, problem_card
-- =============================================================================

-- [10] MLP Mane Character — Twilight Sparkle (Bookworm/Alicorn)
INSERT INTO products (category, subcategory, product_id, name, description,
    price, stock_quantity, rarity, set_name, card_number,
    image_url, is_available, created_at, updated_at)
VALUES (
    'mlp', 'mane_character', uuid(),
    'Twilight Sparkle — Faithful Student / Princess of Friendship',
    'Two-sided Mane Character card. Boosted side: ready 1 friend at your home each turn.',
    980.00, 6, 'Ultra Rare',
    'Premiere! MLP CCG Core Set', 'Mane-001',
    'https://cdn.tcgshop.th/mlp/mane-001-twilight.jpg',
    true, toTimestamp(now()), toTimestamp(now())
);

-- [11] MLP Event Card — Winter Wrap-Up
INSERT INTO products (category, subcategory, product_id, name, description,
    price, stock_quantity, rarity, set_name, card_number,
    image_url, is_available, created_at, updated_at)
VALUES (
    'mlp', 'event_card', uuid(),
    'Winter Wrap-Up',
    'Event card. Move all your home friends to a problem. Great for race-to-problem strategies.',
    320.00, 18, 'Rare',
    'Premiere! MLP CCG Core Set', 'EVT-045',
    'https://cdn.tcgshop.th/mlp/evt-045-wwu.jpg',
    true, toTimestamp(now()), toTimestamp(now())
);

-- [12] MLP Problem Card — The Ursa Minor Problem
INSERT INTO products (category, subcategory, product_id, name, description,
    price, stock_quantity, rarity, set_name, card_number,
    image_url, is_available, created_at, updated_at)
VALUES (
    'mlp', 'problem_card', uuid(),
    'The Ursa Minor Problem',
    'Problem card requiring 4 total power. Bonus: confront to ready all your friends.',
    150.00, 35, 'Common',
    'Canterlot Nights Expansion', 'PRB-012',
    'https://cdn.tcgshop.th/mlp/prb-012-ursa.jpg',
    true, toTimestamp(now()), toTimestamp(now())
);


-- =============================================================================
-- GUNDAM (3 rows)
-- subcategories: mobile_suit, pilot_card, unit_card
-- =============================================================================

-- [13] Gundam Mobile Suit — RX-78-2 Gundam
INSERT INTO products (category, subcategory, product_id, name, description,
    price, stock_quantity, rarity, set_name, card_number,
    image_url, is_available, created_at, updated_at)
VALUES (
    'gundam', 'mobile_suit', uuid(),
    'RX-78-2 Gundam Mobile Suit Card',
    'The original Gundam. Power 6000. Special ability: Beam Rifle deals 3 damage to target unit.',
    1100.00, 14, 'Super Rare',
    'Gundam Card Game: Universal Century Vol.1', 'UC01-001',
    'https://cdn.tcgshop.th/gundam/uc01-001-rx782.jpg',
    true, toTimestamp(now()), toTimestamp(now())
);

-- [14] Gundam Pilot — Amuro Ray
INSERT INTO products (category, subcategory, product_id, name, description,
    price, stock_quantity, rarity, set_name, card_number,
    image_url, is_available, created_at, updated_at)
VALUES (
    'gundam', 'pilot_card', uuid(),
    'Amuro Ray — Newtype Pilot',
    'Pilot card. When paired with RX-78-2: +2000 power, add Newtype Sensing reaction ability.',
    890.00, 9, 'Rare',
    'Gundam Card Game: Universal Century Vol.1', 'UC01-025',
    'https://cdn.tcgshop.th/gundam/uc01-025-amuro.jpg',
    true, toTimestamp(now()), toTimestamp(now())
);

-- [15] Gundam Unit Card — Zaku II (Mass Production Type)
INSERT INTO products (category, subcategory, product_id, name, description,
    price, stock_quantity, rarity, set_name, card_number,
    image_url, is_available, created_at, updated_at)
VALUES (
    'gundam', 'unit_card', uuid(),
    'Zaku II (Mass Production Type)',
    'Zeon unit card. Power 3000. Field ability: deploy two Zaku tokens when this unit attacks.',
    390.00, 22, 'Common',
    'Gundam Card Game: Zeon Rising', 'ZR01-018',
    'https://cdn.tcgshop.th/gundam/zr01-018-zakuii.jpg',
    true, toTimestamp(now()), toTimestamp(now())
);


-- =============================================================================
-- Also INSERT into products_by_id (denormalized copy)
-- In production this would be done in a batch from the app layer.
-- Shown here for one example — repeat pattern for all 15 products.
-- =============================================================================

-- NOTE: In real app code, use a BATCH statement to write to both tables atomically:
--
-- BEGIN BATCH
--   INSERT INTO products         (...) VALUES (...);
--   INSERT INTO products_by_id   (...) VALUES (...);
-- APPLY BATCH;


-- =============================================================================
-- SAMPLE ORDERS & ORDER ITEMS (for schema completeness)
-- =============================================================================

-- Customer UUID (demo)
-- customer_id: 550e8400-e29b-41d4-a716-446655440001

INSERT INTO orders (customer_id, order_id, created_at, status,
    total_amount, shipping_name, shipping_address, payment_method, updated_at)
VALUES (
    550e8400-e29b-41d4-a716-446655440001,
    uuid(),
    toTimestamp(now()),
    'confirmed',
    4350.00,
    'สมชาย รักการ์ด',
    '123 ถนนสุขุมวิท แขวงคลองเตย เขตคลองเตย กรุงเทพฯ 10110',
    'promptpay',
    toTimestamp(now())
);
