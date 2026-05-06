USE trading_card_shop;

-- =============================================================================
-- 3. Yu-Gi-Oh! (Featured Cards)
-- =============================================================================
BEGIN BATCH
    INSERT INTO products (category, subcategory, product_id, name, description, price, stock_quantity, rarity, set_name, card_number, image_url, is_available, created_at, updated_at)
    VALUES ('yugioh', 'monster_card', 33333333-3333-3333-3333-333333333333, 'Blue-Eyes White Dragon', 'The ultimate dragon with 3000 ATK / 2500 DEF.', 3500.00, 5, 'Secret Rare', 'Legend of Blue Eyes White Dragon', 'LOB-EN001', '/images/cards/blue_eyes.png', true, toTimestamp(now()), toTimestamp(now()));

    INSERT INTO products_by_id (product_id, category, subcategory, name, description, price, stock_quantity, rarity, set_name, card_number, image_url, is_available, created_at, updated_at)
    VALUES (33333333-3333-3333-3333-333333333333, 'yugioh', 'monster_card', 'Blue-Eyes White Dragon', 'The ultimate dragon with 3000 ATK / 2500 DEF.', 3500.00, 5, 'Secret Rare', 'Legend of Blue Eyes White Dragon', 'LOB-EN001', '/images/cards/blue_eyes.png', true, toTimestamp(now()), toTimestamp(now()));
APPLY BATCH;

-- Added via UI on 5/6/2026, 5:40:39 AM
INSERT INTO products (category, subcategory, product_id, name, description, price, stock_quantity, rarity, set_name, card_number, image_url, is_available, created_at, updated_at)
VALUES ('yugioh', 'general', a8d047f1-4d96-4f40-b78d-01025c2d9a77, 'Blue eye white dargon', '', 0, 0, 'Common', '', '', '/images/yugioh/1778046039642-694973318.jpg', true, toTimestamp(now()), toTimestamp(now()));

INSERT INTO products_by_id (product_id, category, subcategory, name, description, price, stock_quantity, rarity, set_name, card_number, image_url, is_available, created_at, updated_at)
VALUES (a8d047f1-4d96-4f40-b78d-01025c2d9a77, 'yugioh', 'general', 'Blue eye white dargon', '', 0, 0, 'Common', '', '', '/images/yugioh/1778046039642-694973318.jpg', true, toTimestamp(now()), toTimestamp(now()));

-- Added via UI on 5/6/2026, 5:41:16 AM
INSERT INTO products (category, subcategory, product_id, name, description, price, stock_quantity, rarity, set_name, card_number, image_url, is_available, created_at, updated_at)
VALUES ('yugioh', 'general', a8d047f1-4d96-4f40-b78d-01025c2d9a77, 'Blue eye white dargon', 'blue eye ตัวใหญ่', 1, 30, 'Mixed', 'pokemon go', 'DBT-09', '/images/yugioh/1778046039642-694973318.jpg', true, toTimestamp(now()), toTimestamp(now()));

INSERT INTO products_by_id (product_id, category, subcategory, name, description, price, stock_quantity, rarity, set_name, card_number, image_url, is_available, created_at, updated_at)
VALUES (a8d047f1-4d96-4f40-b78d-01025c2d9a77, 'yugioh', 'general', 'Blue eye white dargon', 'blue eye ตัวใหญ่', 1, 30, 'Mixed', 'pokemon go', 'DBT-09', '/images/yugioh/1778046039642-694973318.jpg', true, toTimestamp(now()), toTimestamp(now()));

-- Added via UI on 5/6/2026, 5:42:11 AM
INSERT INTO products (category, subcategory, product_id, name, description, price, stock_quantity, rarity, set_name, card_number, image_url, is_available, created_at, updated_at)
VALUES ('yugioh', 'general', a8d047f1-4d96-4f40-b78d-01025c2d9a77, 'Blue eye white- dargon', 'blue eye ตัวใหญ่มาก', 1, 30, 'Mixed', 'pokemon go', 'DBT-09', '/images/yugioh/1778046039642-694973318.jpg', true, toTimestamp(now()), toTimestamp(now()));

INSERT INTO products_by_id (product_id, category, subcategory, name, description, price, stock_quantity, rarity, set_name, card_number, image_url, is_available, created_at, updated_at)
VALUES (a8d047f1-4d96-4f40-b78d-01025c2d9a77, 'yugioh', 'general', 'Blue eye white- dargon', 'blue eye ตัวใหญ่มาก', 1, 30, 'Mixed', 'pokemon go', 'DBT-09', '/images/yugioh/1778046039642-694973318.jpg', true, toTimestamp(now()), toTimestamp(now()));

-- Added via UI on 5/6/2026, 6:05:38 AM
INSERT INTO products (category, subcategory, product_id, name, description, price, stock_quantity, rarity, set_name, card_number, image_url, is_available, created_at, updated_at)
VALUES ('yugioh', 'monster_card', 0323e152-e7f2-4c82-98ac-d1253aad7edd, 'Blue-Eyes White Dragon', 'ดราก้อนตำนาน ATK 3000 / DEF 2500 การ์ดไอคอนิคของ Seto Kaiba จากยุค DM เป็นหนึ่งในการ์ดที่มีมูลค่าสะสมสูงที่สุดในประวัติศาสตร์ TCG', 3500, 5, 'Secret Rare', 'Legend of Blue Eyes White Dragon', 'LOB-EN001', '/images/cards/blue_eyes.png', true, toTimestamp(now()), toTimestamp(now()));

INSERT INTO products_by_id (product_id, category, subcategory, name, description, price, stock_quantity, rarity, set_name, card_number, image_url, is_available, created_at, updated_at)
VALUES (0323e152-e7f2-4c82-98ac-d1253aad7edd, 'yugioh', 'monster_card', 'Blue-Eyes White Dragon', 'ดราก้อนตำนาน ATK 3000 / DEF 2500 การ์ดไอคอนิคของ Seto Kaiba จากยุค DM เป็นหนึ่งในการ์ดที่มีมูลค่าสะสมสูงที่สุดในประวัติศาสตร์ TCG', 3500, 5, 'Secret Rare', 'Legend of Blue Eyes White Dragon', 'LOB-EN001', '/images/cards/blue_eyes.png', true, toTimestamp(now()), toTimestamp(now()));

-- Added via UI on 5/6/2026, 6:05:38 AM
INSERT INTO products (category, subcategory, product_id, name, description, price, stock_quantity, rarity, set_name, card_number, image_url, is_available, created_at, updated_at)
VALUES ('yugioh', 'spell_card', 771d5dcd-43c6-4100-b511-2bee9a91ac4b, 'Monster Reborn', 'Special Summon มอนสเตอร์จาก Graveyard ฝั่งใดก็ได้ — การ์ดมนตราระดับตำนานที่ถูก Ban/Limit มาตลอดประวัติศาสตร์', 850, 12, 'Super Rare', 'Metal Raiders', 'MRD-EN065', '', true, toTimestamp(now()), toTimestamp(now()));

INSERT INTO products_by_id (product_id, category, subcategory, name, description, price, stock_quantity, rarity, set_name, card_number, image_url, is_available, created_at, updated_at)
VALUES (771d5dcd-43c6-4100-b511-2bee9a91ac4b, 'yugioh', 'spell_card', 'Monster Reborn', 'Special Summon มอนสเตอร์จาก Graveyard ฝั่งใดก็ได้ — การ์ดมนตราระดับตำนานที่ถูก Ban/Limit มาตลอดประวัติศาสตร์', 850, 12, 'Super Rare', 'Metal Raiders', 'MRD-EN065', '', true, toTimestamp(now()), toTimestamp(now()));

-- Added via UI on 5/6/2026, 6:05:38 AM
INSERT INTO products (category, subcategory, product_id, name, description, price, stock_quantity, rarity, set_name, card_number, image_url, is_available, created_at, updated_at)
VALUES ('yugioh', 'booster_pack', e6166c6b-6f0b-4408-bf52-f8bf10e19532, 'Phantom Nightmare Booster Pack', 'บูสเตอร์แพ็ค 9 ใบ รองรับ Fiendsmith และ Snake-Eye set ล่าสุดปี 2024', 180, 200, 'Mixed', 'Phantom Nightmare', 'PHNI-EN', '', true, toTimestamp(now()), toTimestamp(now()));

INSERT INTO products_by_id (product_id, category, subcategory, name, description, price, stock_quantity, rarity, set_name, card_number, image_url, is_available, created_at, updated_at)
VALUES (e6166c6b-6f0b-4408-bf52-f8bf10e19532, 'yugioh', 'booster_pack', 'Phantom Nightmare Booster Pack', 'บูสเตอร์แพ็ค 9 ใบ รองรับ Fiendsmith และ Snake-Eye set ล่าสุดปี 2024', 180, 200, 'Mixed', 'Phantom Nightmare', 'PHNI-EN', '', true, toTimestamp(now()), toTimestamp(now()));

-- Added via UI on 5/6/2026, 6:05:38 AM
INSERT INTO products (category, subcategory, product_id, name, description, price, stock_quantity, rarity, set_name, card_number, image_url, is_available, created_at, updated_at)
VALUES ('yugioh', 'extra_deck', c2649e31-2f4a-4b87-90d0-4c99fa7360c8, 'Stardust Dragon', 'Level 8 Synchro — Negate ทำลายการ์ดบนสนาม การ์ดซิกเนเจอร์ของ Yusei Fudo จาก Yu-Gi-Oh! 5Ds', 1200, 8, 'Ultra Rare', 'The Duelist Genesis', 'TDGS-EN040', '', true, toTimestamp(now()), toTimestamp(now()));

INSERT INTO products_by_id (product_id, category, subcategory, name, description, price, stock_quantity, rarity, set_name, card_number, image_url, is_available, created_at, updated_at)
VALUES (c2649e31-2f4a-4b87-90d0-4c99fa7360c8, 'yugioh', 'extra_deck', 'Stardust Dragon', 'Level 8 Synchro — Negate ทำลายการ์ดบนสนาม การ์ดซิกเนเจอร์ของ Yusei Fudo จาก Yu-Gi-Oh! 5Ds', 1200, 8, 'Ultra Rare', 'The Duelist Genesis', 'TDGS-EN040', '', true, toTimestamp(now()), toTimestamp(now()));

-- Added via UI on 5/6/2026, 6:05:38 AM
INSERT INTO products (category, subcategory, product_id, name, description, price, stock_quantity, rarity, set_name, card_number, image_url, is_available, created_at, updated_at)
VALUES ('yugioh', 'structure_deck', 2a7340d0-27be-4cb8-8838-6f9381c46486, 'Structure Deck: Dragon''s Roar', 'เด็ค 40 ใบพร้อมเล่น ธีมดราก้อน มีการ์ด Exclusive ที่หาจากที่อื่นไม่ได้', 490, 30, 'Common', 'Dragon''s Roar Structure Deck', 'SD1-EN', '', true, toTimestamp(now()), toTimestamp(now()));

INSERT INTO products_by_id (product_id, category, subcategory, name, description, price, stock_quantity, rarity, set_name, card_number, image_url, is_available, created_at, updated_at)
VALUES (2a7340d0-27be-4cb8-8838-6f9381c46486, 'yugioh', 'structure_deck', 'Structure Deck: Dragon''s Roar', 'เด็ค 40 ใบพร้อมเล่น ธีมดราก้อน มีการ์ด Exclusive ที่หาจากที่อื่นไม่ได้', 490, 30, 'Common', 'Dragon''s Roar Structure Deck', 'SD1-EN', '', true, toTimestamp(now()), toTimestamp(now()));

-- Added via UI on 5/6/2026, 6:30:02 AM
INSERT INTO products (category, subcategory, product_id, name, description, price, stock_quantity, rarity, set_name, card_number, image_url, is_available, created_at, updated_at)
VALUES ('yugioh', 'monster_card', d32b25c7-8620-4668-9dd7-546904a21b91, 'Blue-Eyes White Dragon', 'ดราก้อนตำนาน ATK 3000 / DEF 2500 การ์ดไอคอนิคของ Seto Kaiba จากยุค DM เป็นหนึ่งในการ์ดที่มีมูลค่าสะสมสูงที่สุดในประวัติศาสตร์ TCG', 3500, 5, 'Secret Rare', 'Legend of Blue Eyes White Dragon', 'LOB-EN001', '/images/cards/blue_eyes.png', true, toTimestamp(now()), toTimestamp(now()));

INSERT INTO products_by_id (product_id, category, subcategory, name, description, price, stock_quantity, rarity, set_name, card_number, image_url, is_available, created_at, updated_at)
VALUES (d32b25c7-8620-4668-9dd7-546904a21b91, 'yugioh', 'monster_card', 'Blue-Eyes White Dragon', 'ดราก้อนตำนาน ATK 3000 / DEF 2500 การ์ดไอคอนิคของ Seto Kaiba จากยุค DM เป็นหนึ่งในการ์ดที่มีมูลค่าสะสมสูงที่สุดในประวัติศาสตร์ TCG', 3500, 5, 'Secret Rare', 'Legend of Blue Eyes White Dragon', 'LOB-EN001', '/images/cards/blue_eyes.png', true, toTimestamp(now()), toTimestamp(now()));

-- Added via UI on 5/6/2026, 6:30:02 AM
INSERT INTO products (category, subcategory, product_id, name, description, price, stock_quantity, rarity, set_name, card_number, image_url, is_available, created_at, updated_at)
VALUES ('yugioh', 'spell_card', af8306aa-48d3-4c5a-bbaa-0488809302ba, 'Monster Reborn', 'Special Summon มอนสเตอร์จาก Graveyard ฝั่งใดก็ได้ — การ์ดมนตราระดับตำนานที่ถูก Ban/Limit มาตลอดประวัติศาสตร์', 850, 12, 'Super Rare', 'Metal Raiders', 'MRD-EN065', '', true, toTimestamp(now()), toTimestamp(now()));

INSERT INTO products_by_id (product_id, category, subcategory, name, description, price, stock_quantity, rarity, set_name, card_number, image_url, is_available, created_at, updated_at)
VALUES (af8306aa-48d3-4c5a-bbaa-0488809302ba, 'yugioh', 'spell_card', 'Monster Reborn', 'Special Summon มอนสเตอร์จาก Graveyard ฝั่งใดก็ได้ — การ์ดมนตราระดับตำนานที่ถูก Ban/Limit มาตลอดประวัติศาสตร์', 850, 12, 'Super Rare', 'Metal Raiders', 'MRD-EN065', '', true, toTimestamp(now()), toTimestamp(now()));

-- Added via UI on 5/6/2026, 6:30:02 AM
INSERT INTO products (category, subcategory, product_id, name, description, price, stock_quantity, rarity, set_name, card_number, image_url, is_available, created_at, updated_at)
VALUES ('yugioh', 'booster_pack', ad90bbe1-e9bf-49a6-b510-81ae75727b37, 'Phantom Nightmare Booster Pack', 'บูสเตอร์แพ็ค 9 ใบ รองรับ Fiendsmith และ Snake-Eye set ล่าสุดปี 2024', 180, 200, 'Mixed', 'Phantom Nightmare', 'PHNI-EN', '', true, toTimestamp(now()), toTimestamp(now()));

INSERT INTO products_by_id (product_id, category, subcategory, name, description, price, stock_quantity, rarity, set_name, card_number, image_url, is_available, created_at, updated_at)
VALUES (ad90bbe1-e9bf-49a6-b510-81ae75727b37, 'yugioh', 'booster_pack', 'Phantom Nightmare Booster Pack', 'บูสเตอร์แพ็ค 9 ใบ รองรับ Fiendsmith และ Snake-Eye set ล่าสุดปี 2024', 180, 200, 'Mixed', 'Phantom Nightmare', 'PHNI-EN', '', true, toTimestamp(now()), toTimestamp(now()));

-- Added via UI on 5/6/2026, 6:30:02 AM
INSERT INTO products (category, subcategory, product_id, name, description, price, stock_quantity, rarity, set_name, card_number, image_url, is_available, created_at, updated_at)
VALUES ('yugioh', 'extra_deck', 9aa2285a-31ea-45b9-8619-937ac5e92cd8, 'Stardust Dragon', 'Level 8 Synchro — Negate ทำลายการ์ดบนสนาม การ์ดซิกเนเจอร์ของ Yusei Fudo จาก Yu-Gi-Oh! 5Ds', 1200, 8, 'Ultra Rare', 'The Duelist Genesis', 'TDGS-EN040', '', true, toTimestamp(now()), toTimestamp(now()));

INSERT INTO products_by_id (product_id, category, subcategory, name, description, price, stock_quantity, rarity, set_name, card_number, image_url, is_available, created_at, updated_at)
VALUES (9aa2285a-31ea-45b9-8619-937ac5e92cd8, 'yugioh', 'extra_deck', 'Stardust Dragon', 'Level 8 Synchro — Negate ทำลายการ์ดบนสนาม การ์ดซิกเนเจอร์ของ Yusei Fudo จาก Yu-Gi-Oh! 5Ds', 1200, 8, 'Ultra Rare', 'The Duelist Genesis', 'TDGS-EN040', '', true, toTimestamp(now()), toTimestamp(now()));

-- Added via UI on 5/6/2026, 6:30:02 AM
INSERT INTO products (category, subcategory, product_id, name, description, price, stock_quantity, rarity, set_name, card_number, image_url, is_available, created_at, updated_at)
VALUES ('yugioh', 'structure_deck', 238b06ad-5721-4bf9-9fbf-9cc370f251ec, 'Structure Deck: Dragon''s Roar', 'เด็ค 40 ใบพร้อมเล่น ธีมดราก้อน มีการ์ด Exclusive ที่หาจากที่อื่นไม่ได้', 490, 30, 'Common', 'Dragon''s Roar Structure Deck', 'SD1-EN', '', true, toTimestamp(now()), toTimestamp(now()));

INSERT INTO products_by_id (product_id, category, subcategory, name, description, price, stock_quantity, rarity, set_name, card_number, image_url, is_available, created_at, updated_at)
VALUES (238b06ad-5721-4bf9-9fbf-9cc370f251ec, 'yugioh', 'structure_deck', 'Structure Deck: Dragon''s Roar', 'เด็ค 40 ใบพร้อมเล่น ธีมดราก้อน มีการ์ด Exclusive ที่หาจากที่อื่นไม่ได้', 490, 30, 'Common', 'Dragon''s Roar Structure Deck', 'SD1-EN', '', true, toTimestamp(now()), toTimestamp(now()));
