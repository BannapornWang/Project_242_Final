USE trading_card_shop;

-- =============================================================================
-- 4. Cardfight!! Vanguard (Featured Cards)
-- =============================================================================
BEGIN BATCH
    INSERT INTO products (category, subcategory, product_id, name, description, price, stock_quantity, rarity, set_name, card_number, image_url, is_available, created_at, updated_at)
    VALUES ('vanguard', 'grade_3_unit', 44444444-4444-4444-4444-444444444444, 'Blaster Blade', 'Grade 3 Royal Paladin. Power 10000. On Ride: retire one of opponent''s rear-guards.', 750.00, 10, 'Rare', 'Cardfight!! Vanguard V Vol.01', 'V-BT01/006EN', '/images/cards/blaster_blade.png', true, toTimestamp(now()), toTimestamp(now()));

    INSERT INTO products_by_id (product_id, category, subcategory, name, description, price, stock_quantity, rarity, set_name, card_number, image_url, is_available, created_at, updated_at)
    VALUES (44444444-4444-4444-4444-444444444444, 'vanguard', 'grade_3_unit', 'Blaster Blade', 'Grade 3 Royal Paladin. Power 10000. On Ride: retire one of opponent''s rear-guards.', 750.00, 10, 'Rare', 'Cardfight!! Vanguard V Vol.01', 'V-BT01/006EN', '/images/cards/blaster_blade.png', true, toTimestamp(now()), toTimestamp(now()));
APPLY BATCH;

-- Added via UI on 5/6/2026, 3:38:33 AM
INSERT INTO products (category, subcategory, product_id, name, description, price, stock_quantity, rarity, set_name, card_number, image_url, is_available, created_at, updated_at)
VALUES ('vanguard', 'Normal Unit', 09af1d85-0845-411b-827e-34c343d9bed6, 'Youthberk "Skyfall Arms"', 'เท่แบบหยุดไม่อยู่', 300, 500, 'Ultra Rare', 'RevolDress', 'D-SS12/SIR14EN', '/images/vanguard/1778038713610-669099959.png', true, toTimestamp(now()), toTimestamp(now()));

INSERT INTO products_by_id (product_id, category, subcategory, name, description, price, stock_quantity, rarity, set_name, card_number, image_url, is_available, created_at, updated_at)
VALUES (09af1d85-0845-411b-827e-34c343d9bed6, 'vanguard', 'Normal Unit', 'Youthberk "Skyfall Arms"', 'เท่แบบหยุดไม่อยู่', 300, 500, 'Ultra Rare', 'RevolDress', 'D-SS12/SIR14EN', '/images/vanguard/1778038713610-669099959.png', true, toTimestamp(now()), toTimestamp(now()));

-- Added via UI on 5/6/2026, 3:53:24 AM
INSERT INTO products (category, subcategory, product_id, name, description, price, stock_quantity, rarity, set_name, card_number, image_url, is_available, created_at, updated_at)
VALUES ('vanguard', 'PR', 7c9e9b96-dbe4-49c3-8c2a-075dd5a73813, 'Blaster Blade Liberity', 'Super Rare Blaster Blade', 2000, 10000, 'Secret Rare', 'PR', 'PR/0779', '/images/vanguard/1778036055201-306662524.png', true, toTimestamp(now()), toTimestamp(now()));

INSERT INTO products_by_id (product_id, category, subcategory, name, description, price, stock_quantity, rarity, set_name, card_number, image_url, is_available, created_at, updated_at)
VALUES (7c9e9b96-dbe4-49c3-8c2a-075dd5a73813, 'vanguard', 'PR', 'Blaster Blade Liberity', 'Super Rare Blaster Blade', 2000, 10000, 'Secret Rare', 'PR', 'PR/0779', '/images/vanguard/1778036055201-306662524.png', true, toTimestamp(now()), toTimestamp(now()));

-- Added via UI on 5/6/2026, 3:54:02 AM
INSERT INTO products (category, subcategory, product_id, name, description, price, stock_quantity, rarity, set_name, card_number, image_url, is_available, created_at, updated_at)
VALUES ('vanguard', 'PR', 7c9e9b96-dbe4-49c3-8c2a-075dd5a73813, 'Blaster Blade Liberity', 'Super Rare Blaster Blade', 2000, 5000, 'Secret Rare', 'PR', 'PR/0779', '/images/vanguard/1778036055201-306662524.png', true, toTimestamp(now()), toTimestamp(now()));

INSERT INTO products_by_id (product_id, category, subcategory, name, description, price, stock_quantity, rarity, set_name, card_number, image_url, is_available, created_at, updated_at)
VALUES (7c9e9b96-dbe4-49c3-8c2a-075dd5a73813, 'vanguard', 'PR', 'Blaster Blade Liberity', 'Super Rare Blaster Blade', 2000, 5000, 'Secret Rare', 'PR', 'PR/0779', '/images/vanguard/1778036055201-306662524.png', true, toTimestamp(now()), toTimestamp(now()));

-- Added via UI on 5/6/2026, 3:58:03 AM
INSERT INTO products (category, subcategory, product_id, name, description, price, stock_quantity, rarity, set_name, card_number, image_url, is_available, created_at, updated_at)
VALUES ('vanguard', 'Normal Unit', 7c9e9b96-dbe4-49c3-8c2a-075dd5a73813, 'Blaster Blade Liberity', 'Super Rare Blaster Blade', 2000, 5000, 'Secret Rare', 'PR', 'PR/0779', '/images/vanguard/1778036055201-306662524.png', true, toTimestamp(now()), toTimestamp(now()));

INSERT INTO products_by_id (product_id, category, subcategory, name, description, price, stock_quantity, rarity, set_name, card_number, image_url, is_available, created_at, updated_at)
VALUES (7c9e9b96-dbe4-49c3-8c2a-075dd5a73813, 'vanguard', 'Normal Unit', 'Blaster Blade Liberity', 'Super Rare Blaster Blade', 2000, 5000, 'Secret Rare', 'PR', 'PR/0779', '/images/vanguard/1778036055201-306662524.png', true, toTimestamp(now()), toTimestamp(now()));

-- Added via UI on 5/6/2026, 3:58:07 AM
INSERT INTO products (category, subcategory, product_id, name, description, price, stock_quantity, rarity, set_name, card_number, image_url, is_available, created_at, updated_at)
VALUES ('vanguard', 'Normal Unit', 7c9e9b96-dbe4-49c3-8c2a-075dd5a73813, 'Blaster Blade Liberity', 'Super Rare Blaster Blade', 2000, 5000, 'Secret Rare', 'PR', 'PR/0779', '/images/vanguard/1778036055201-306662524.png', true, toTimestamp(now()), toTimestamp(now()));

INSERT INTO products_by_id (product_id, category, subcategory, name, description, price, stock_quantity, rarity, set_name, card_number, image_url, is_available, created_at, updated_at)
VALUES (7c9e9b96-dbe4-49c3-8c2a-075dd5a73813, 'vanguard', 'Normal Unit', 'Blaster Blade Liberity', 'Super Rare Blaster Blade', 2000, 5000, 'Secret Rare', 'PR', 'PR/0779', '/images/vanguard/1778036055201-306662524.png', true, toTimestamp(now()), toTimestamp(now()));

-- Added via UI on 5/6/2026, 3:58:17 AM
INSERT INTO products (category, subcategory, product_id, name, description, price, stock_quantity, rarity, set_name, card_number, image_url, is_available, created_at, updated_at)
VALUES ('vanguard', 'Normal Unit', 09af1d85-0845-411b-827e-34c343d9bed6, 'Youthberk "Skyfall Arms"', 'เท่แบบหยุดไม่อยู่', 300, 600, 'Ultra Rare', 'RevolDress', 'D-SS12/SIR14EN', '/images/vanguard/1778038713610-669099959.png', true, toTimestamp(now()), toTimestamp(now()));

INSERT INTO products_by_id (product_id, category, subcategory, name, description, price, stock_quantity, rarity, set_name, card_number, image_url, is_available, created_at, updated_at)
VALUES (09af1d85-0845-411b-827e-34c343d9bed6, 'vanguard', 'Normal Unit', 'Youthberk "Skyfall Arms"', 'เท่แบบหยุดไม่อยู่', 300, 600, 'Ultra Rare', 'RevolDress', 'D-SS12/SIR14EN', '/images/vanguard/1778038713610-669099959.png', true, toTimestamp(now()), toTimestamp(now()));

-- Added via UI on 5/6/2026, 6:05:38 AM
INSERT INTO products (category, subcategory, product_id, name, description, price, stock_quantity, rarity, set_name, card_number, image_url, is_available, created_at, updated_at)
VALUES ('vanguard', 'grade_3_unit', 6c90aad1-b57e-4e06-90db-f832269a114d, 'Blaster Blade', 'Grade 3 Royal Paladin พลัง 10000 — On Ride: ทำลาย rear-guard ฝ่ายตรงข้าม 1 ตัว การ์ดซิกเนเจอร์ของ Aichi Sendou', 750, 10, 'Rare', 'Cardfight!! Vanguard V Vol.01', 'V-BT01/006EN', '/images/cards/blaster_blade.png', true, toTimestamp(now()), toTimestamp(now()));

INSERT INTO products_by_id (product_id, category, subcategory, name, description, price, stock_quantity, rarity, set_name, card_number, image_url, is_available, created_at, updated_at)
VALUES (6c90aad1-b57e-4e06-90db-f832269a114d, 'vanguard', 'grade_3_unit', 'Blaster Blade', 'Grade 3 Royal Paladin พลัง 10000 — On Ride: ทำลาย rear-guard ฝ่ายตรงข้าม 1 ตัว การ์ดซิกเนเจอร์ของ Aichi Sendou', 750, 10, 'Rare', 'Cardfight!! Vanguard V Vol.01', 'V-BT01/006EN', '/images/cards/blaster_blade.png', true, toTimestamp(now()), toTimestamp(now()));

-- Added via UI on 5/6/2026, 6:05:38 AM
INSERT INTO products (category, subcategory, product_id, name, description, price, stock_quantity, rarity, set_name, card_number, image_url, is_available, created_at, updated_at)
VALUES ('vanguard', 'trigger_unit', 68abf949-ec18-4547-b594-eca954c12644, 'Bringer of Good Luck, Epona', 'Grade 0 Critical Trigger พลัง 5000 / Shield 30000 จำเป็นสำหรับเด็ค Royal Paladin', 220, 40, 'Common', 'V Extra Booster 16', 'V-EB16/030EN', '', true, toTimestamp(now()), toTimestamp(now()));

INSERT INTO products_by_id (product_id, category, subcategory, name, description, price, stock_quantity, rarity, set_name, card_number, image_url, is_available, created_at, updated_at)
VALUES (68abf949-ec18-4547-b594-eca954c12644, 'vanguard', 'trigger_unit', 'Bringer of Good Luck, Epona', 'Grade 0 Critical Trigger พลัง 5000 / Shield 30000 จำเป็นสำหรับเด็ค Royal Paladin', 220, 40, 'Common', 'V Extra Booster 16', 'V-EB16/030EN', '', true, toTimestamp(now()), toTimestamp(now()));

-- Added via UI on 5/6/2026, 6:05:39 AM
INSERT INTO products (category, subcategory, product_id, name, description, price, stock_quantity, rarity, set_name, card_number, image_url, is_available, created_at, updated_at)
VALUES ('vanguard', 'booster_set', 95a7fe53-10cd-40b2-9fb2-2bf33c058ad8, 'V Booster Set 12: Divine Lightning Radiance', '7 ใบต่อแพ็ค รองรับ Oracle Think Tank และ Narukami', 160, 150, 'Mixed', 'Divine Lightning Radiance', 'V-BT12-EN', '', true, toTimestamp(now()), toTimestamp(now()));

INSERT INTO products_by_id (product_id, category, subcategory, name, description, price, stock_quantity, rarity, set_name, card_number, image_url, is_available, created_at, updated_at)
VALUES (95a7fe53-10cd-40b2-9fb2-2bf33c058ad8, 'vanguard', 'booster_set', 'V Booster Set 12: Divine Lightning Radiance', '7 ใบต่อแพ็ค รองรับ Oracle Think Tank และ Narukami', 160, 150, 'Mixed', 'Divine Lightning Radiance', 'V-BT12-EN', '', true, toTimestamp(now()), toTimestamp(now()));

-- Added via UI on 5/6/2026, 6:05:39 AM
INSERT INTO products (category, subcategory, product_id, name, description, price, stock_quantity, rarity, set_name, card_number, image_url, is_available, created_at, updated_at)
VALUES ('vanguard', 'trial_deck', 67f66332-94c2-47ce-aa3f-73ba4a1eaf2b, 'Trial Deck: Royal Paladin — Blaster Blade Edition', 'เด็ค 50 ใบพร้อมเล่นสำหรับผู้เริ่มต้น มี RR 2 ใบ', 590, 25, 'Common', 'V Trial Deck 01', 'V-TD01-EN', '', true, toTimestamp(now()), toTimestamp(now()));

INSERT INTO products_by_id (product_id, category, subcategory, name, description, price, stock_quantity, rarity, set_name, card_number, image_url, is_available, created_at, updated_at)
VALUES (67f66332-94c2-47ce-aa3f-73ba4a1eaf2b, 'vanguard', 'trial_deck', 'Trial Deck: Royal Paladin — Blaster Blade Edition', 'เด็ค 50 ใบพร้อมเล่นสำหรับผู้เริ่มต้น มี RR 2 ใบ', 590, 25, 'Common', 'V Trial Deck 01', 'V-TD01-EN', '', true, toTimestamp(now()), toTimestamp(now()));
