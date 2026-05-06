USE trading_card_shop;

-- =============================================================================
-- 4. Cardfight!! Vanguard (Featured Cards)
-- =============================================================================

-- Added via UI on 5/6/2026, 3:53:24 AM
INSERT INTO products (category, subcategory, product_id, name, description, price, stock_quantity, rarity, set_name, card_number, image_url, is_available, created_at, updated_at)
VALUES ('vanguard', 'PR', 7c9e9b96-dbe4-49c3-8c2a-075dd5a73813, 'Blaster Blade Liberity', 'Super Rare Blaster Blade', 2000, 10000, 'Secret Rare', 'PR', 'PR/0779', '/images/vanguard/1778036055201-306662524.png', true, toTimestamp(now()), toTimestamp(now()));

INSERT INTO products_by_id (product_id, category, subcategory, name, description, price, stock_quantity, rarity, set_name, card_number, image_url, is_available, created_at, updated_at)
VALUES (7c9e9b96-dbe4-49c3-8c2a-075dd5a73813, 'vanguard', 'PR', 'Blaster Blade Liberity', 'Super Rare Blaster Blade', 2000, 10000, 'Secret Rare', 'PR', 'PR/0779', '/images/vanguard/1778036055201-306662524.png', true, toTimestamp(now()), toTimestamp(now()));

-- Added via UI on 5/6/2026, 3:38:33 AM
INSERT INTO products (category, subcategory, product_id, name, description, price, stock_quantity, rarity, set_name, card_number, image_url, is_available, created_at, updated_at)
VALUES ('vanguard', 'Normal Unit', 09af1d85-0845-411b-827e-34c343d9bed6, 'Youthberk "Skyfall Arms"', 'เท่แบบหยุดไม่อยู่', 300, 500, 'Ultra Rare', 'RevolDress', 'D-SS12/SIR14EN', '/images/vanguard/1778038713610-669099959.png', true, toTimestamp(now()), toTimestamp(now()));

INSERT INTO products_by_id (product_id, category, subcategory, name, description, price, stock_quantity, rarity, set_name, card_number, image_url, is_available, created_at, updated_at)
VALUES (09af1d85-0845-411b-827e-34c343d9bed6, 'vanguard', 'Normal Unit', 'Youthberk "Skyfall Arms"', 'เท่แบบหยุดไม่อยู่', 300, 500, 'Ultra Rare', 'RevolDress', 'D-SS12/SIR14EN', '/images/vanguard/1778038713610-669099959.png', true, toTimestamp(now()), toTimestamp(now()));

-- Added via UI on 5/6/2026, 8:40:10 AM
INSERT INTO products (category, subcategory, product_id, name, description, price, stock_quantity, rarity, set_name, card_number, image_url, is_available, created_at, updated_at)
VALUES ('vanguard', 'trial_deck', 1b83df18-f047-4c02-8e02-bc5d23b751b9, 'Trial Deck: Royal Paladin — Blaster Blade Edition', 'เด็ค 50 ใบพร้อมเล่นสำหรับผู้เริ่มต้น มี RR 2 ใบ', 590, 25, 'Common', 'V Trial Deck 01', 'V-TD01-EN', '/images/vanguard/1778056810022-546779971.png', true, toTimestamp(now()), toTimestamp(now()));

INSERT INTO products_by_id (product_id, category, subcategory, name, description, price, stock_quantity, rarity, set_name, card_number, image_url, is_available, created_at, updated_at)
VALUES (1b83df18-f047-4c02-8e02-bc5d23b751b9, 'vanguard', 'trial_deck', 'Trial Deck: Royal Paladin — Blaster Blade Edition', 'เด็ค 50 ใบพร้อมเล่นสำหรับผู้เริ่มต้น มี RR 2 ใบ', 590, 25, 'Common', 'V Trial Deck 01', 'V-TD01-EN', '/images/vanguard/1778056810022-546779971.png', true, toTimestamp(now()), toTimestamp(now()));
