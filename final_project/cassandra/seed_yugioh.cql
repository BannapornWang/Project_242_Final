USE trading_card_shop;

-- =============================================================================
-- 3. Yu-Gi-Oh! (Featured Cards)
-- =============================================================================

-- Added via UI on 5/6/2026, 5:42:11 AM
INSERT INTO products (category, subcategory, product_id, name, description, price, stock_quantity, rarity, set_name, card_number, image_url, is_available, created_at, updated_at)
VALUES ('yugioh', 'general', a8d047f1-4d96-4f40-b78d-01025c2d9a77, 'Blue eye white- dargon', 'blue eye ตัวใหญ่มาก', 1, 30, 'Mixed', 'pokemon go', 'DBT-09', '/images/yugioh/1778046039642-694973318.jpg', true, toTimestamp(now()), toTimestamp(now()));

INSERT INTO products_by_id (product_id, category, subcategory, name, description, price, stock_quantity, rarity, set_name, card_number, image_url, is_available, created_at, updated_at)
VALUES (a8d047f1-4d96-4f40-b78d-01025c2d9a77, 'yugioh', 'general', 'Blue eye white- dargon', 'blue eye ตัวใหญ่มาก', 1, 30, 'Mixed', 'pokemon go', 'DBT-09', '/images/yugioh/1778046039642-694973318.jpg', true, toTimestamp(now()), toTimestamp(now()));

-- Added via UI on 5/6/2026, 8:25:45 AM
INSERT INTO products (category, subcategory, product_id, name, description, price, stock_quantity, rarity, set_name, card_number, image_url, is_available, created_at, updated_at)
VALUES ('yugioh', 'monster_card', b1213173-cda8-48c3-9c2c-b36f960323be, 'Blue-Eyes White Dragon', 'ดราก้อนตำนาน ATK 3000 / DEF 2500 การ์ดไอคอนิคของ Seto Kaiba จากยุค DM เป็นหนึ่งในการ์ดที่มีมูลค่าสะสมสูงที่สุดในประวัติศาสตร์ TCG', 3500, 5, 'Secret Rare', 'Legend of Blue Eyes White Dragon', 'LOB-EN001', '/images/cards/blue_eyes.png', true, toTimestamp(now()), toTimestamp(now()));

INSERT INTO products_by_id (product_id, category, subcategory, name, description, price, stock_quantity, rarity, set_name, card_number, image_url, is_available, created_at, updated_at)
VALUES (b1213173-cda8-48c3-9c2c-b36f960323be, 'yugioh', 'monster_card', 'Blue-Eyes White Dragon', 'ดราก้อนตำนาน ATK 3000 / DEF 2500 การ์ดไอคอนิคของ Seto Kaiba จากยุค DM เป็นหนึ่งในการ์ดที่มีมูลค่าสะสมสูงที่สุดในประวัติศาสตร์ TCG', 3500, 5, 'Secret Rare', 'Legend of Blue Eyes White Dragon', 'LOB-EN001', '/images/cards/blue_eyes.png', true, toTimestamp(now()), toTimestamp(now()));

-- Added via UI on 5/6/2026, 8:25:45 AM
INSERT INTO products (category, subcategory, product_id, name, description, price, stock_quantity, rarity, set_name, card_number, image_url, is_available, created_at, updated_at)
VALUES ('yugioh', 'spell_card', 464125d8-1bc6-4b4d-8949-40437494c09a, 'Monster Reborn', 'Special Summon มอนสเตอร์จาก Graveyard ฝั่งใดก็ได้ — การ์ดมนตราระดับตำนานที่ถูก Ban/Limit มาตลอดประวัติศาสตร์', 850, 12, 'Super Rare', 'Metal Raiders', 'MRD-EN065', '', true, toTimestamp(now()), toTimestamp(now()));

INSERT INTO products_by_id (product_id, category, subcategory, name, description, price, stock_quantity, rarity, set_name, card_number, image_url, is_available, created_at, updated_at)
VALUES (464125d8-1bc6-4b4d-8949-40437494c09a, 'yugioh', 'spell_card', 'Monster Reborn', 'Special Summon มอนสเตอร์จาก Graveyard ฝั่งใดก็ได้ — การ์ดมนตราระดับตำนานที่ถูก Ban/Limit มาตลอดประวัติศาสตร์', 850, 12, 'Super Rare', 'Metal Raiders', 'MRD-EN065', '', true, toTimestamp(now()), toTimestamp(now()));

-- Added via UI on 5/6/2026, 8:25:45 AM
INSERT INTO products (category, subcategory, product_id, name, description, price, stock_quantity, rarity, set_name, card_number, image_url, is_available, created_at, updated_at)
VALUES ('yugioh', 'booster_pack', 8c7b7302-da49-4607-9dbc-5ccdfc20846f, 'Phantom Nightmare Booster Pack', 'บูสเตอร์แพ็ค 9 ใบ รองรับ Fiendsmith และ Snake-Eye set ล่าสุดปี 2024', 180, 200, 'Mixed', 'Phantom Nightmare', 'PHNI-EN', '', true, toTimestamp(now()), toTimestamp(now()));

INSERT INTO products_by_id (product_id, category, subcategory, name, description, price, stock_quantity, rarity, set_name, card_number, image_url, is_available, created_at, updated_at)
VALUES (8c7b7302-da49-4607-9dbc-5ccdfc20846f, 'yugioh', 'booster_pack', 'Phantom Nightmare Booster Pack', 'บูสเตอร์แพ็ค 9 ใบ รองรับ Fiendsmith และ Snake-Eye set ล่าสุดปี 2024', 180, 200, 'Mixed', 'Phantom Nightmare', 'PHNI-EN', '', true, toTimestamp(now()), toTimestamp(now()));

-- Added via UI on 5/6/2026, 8:25:45 AM
INSERT INTO products (category, subcategory, product_id, name, description, price, stock_quantity, rarity, set_name, card_number, image_url, is_available, created_at, updated_at)
VALUES ('yugioh', 'extra_deck', dae0a5b6-dd3b-4a40-8e47-a9f1b1494c01, 'Stardust Dragon', 'Level 8 Synchro — Negate ทำลายการ์ดบนสนาม การ์ดซิกเนเจอร์ของ Yusei Fudo จาก Yu-Gi-Oh! 5Ds', 1200, 8, 'Ultra Rare', 'The Duelist Genesis', 'TDGS-EN040', '', true, toTimestamp(now()), toTimestamp(now()));

INSERT INTO products_by_id (product_id, category, subcategory, name, description, price, stock_quantity, rarity, set_name, card_number, image_url, is_available, created_at, updated_at)
VALUES (dae0a5b6-dd3b-4a40-8e47-a9f1b1494c01, 'yugioh', 'extra_deck', 'Stardust Dragon', 'Level 8 Synchro — Negate ทำลายการ์ดบนสนาม การ์ดซิกเนเจอร์ของ Yusei Fudo จาก Yu-Gi-Oh! 5Ds', 1200, 8, 'Ultra Rare', 'The Duelist Genesis', 'TDGS-EN040', '', true, toTimestamp(now()), toTimestamp(now()));

-- Added via UI on 5/6/2026, 8:25:45 AM
INSERT INTO products (category, subcategory, product_id, name, description, price, stock_quantity, rarity, set_name, card_number, image_url, is_available, created_at, updated_at)
VALUES ('yugioh', 'structure_deck', 3b2a36b9-ad0f-4720-8e66-426ffb1c11ae, 'Structure Deck: Dragon''s Roar', 'เด็ค 40 ใบพร้อมเล่น ธีมดราก้อน มีการ์ด Exclusive ที่หาจากที่อื่นไม่ได้', 490, 30, 'Common', 'Dragon''s Roar Structure Deck', 'SD1-EN', '', true, toTimestamp(now()), toTimestamp(now()));

INSERT INTO products_by_id (product_id, category, subcategory, name, description, price, stock_quantity, rarity, set_name, card_number, image_url, is_available, created_at, updated_at)
VALUES (3b2a36b9-ad0f-4720-8e66-426ffb1c11ae, 'yugioh', 'structure_deck', 'Structure Deck: Dragon''s Roar', 'เด็ค 40 ใบพร้อมเล่น ธีมดราก้อน มีการ์ด Exclusive ที่หาจากที่อื่นไม่ได้', 490, 30, 'Common', 'Dragon''s Roar Structure Deck', 'SD1-EN', '', true, toTimestamp(now()), toTimestamp(now()));

-- [ID: 464125d8-1bc6-4b4d-8949-40437494c09a] Added/Updated via UI on 5/6/2026, 9:51:44 AM
INSERT INTO products (category, subcategory, product_id, name, description, price, stock_quantity, rarity, set_name, card_number, image_url, is_available, created_at, updated_at)
VALUES ('yugioh', 'spell_card', 464125d8-1bc6-4b4d-8949-40437494c09a, 'Monster Reborn', 'Special Summon มอนสเตอร์จาก Graveyard ฝั่งใดก็ได้ — การ์ดมนตราระดับตำนานที่ถูก Ban/Limit มาตลอดประวัติศาสตร์', 850, 12, 'Super Rare', 'Metal Raiders', 'MRD-EN065', '/images/yugioh/1778061103939-153516704.png', true, toTimestamp(now()), toTimestamp(now()));

INSERT INTO products_by_id (product_id, category, subcategory, name, description, price, stock_quantity, rarity, set_name, card_number, image_url, is_available, created_at, updated_at)
VALUES (464125d8-1bc6-4b4d-8949-40437494c09a, 'yugioh', 'spell_card', 'Monster Reborn', 'Special Summon มอนสเตอร์จาก Graveyard ฝั่งใดก็ได้ — การ์ดมนตราระดับตำนานที่ถูก Ban/Limit มาตลอดประวัติศาสตร์', 850, 12, 'Super Rare', 'Metal Raiders', 'MRD-EN065', '/images/yugioh/1778061103939-153516704.png', true, toTimestamp(now()), toTimestamp(now()));

-- [ID: 8c7b7302-da49-4607-9dbc-5ccdfc20846f] Added/Updated via UI on 5/6/2026, 9:52:55 AM
INSERT INTO products (category, subcategory, product_id, name, description, price, stock_quantity, rarity, set_name, card_number, image_url, is_available, created_at, updated_at)
VALUES ('yugioh', 'booster_pack', 8c7b7302-da49-4607-9dbc-5ccdfc20846f, 'Phantom Nightmare Booster Pack', 'บูสเตอร์แพ็ค 9 ใบ รองรับ Fiendsmith และ Snake-Eye set ล่าสุดปี 2024', 180, 200, 'Mixed', 'Phantom Nightmare', 'PHNI-EN', '/images/yugioh/1778061175300-75507916.png', true, toTimestamp(now()), toTimestamp(now()));

INSERT INTO products_by_id (product_id, category, subcategory, name, description, price, stock_quantity, rarity, set_name, card_number, image_url, is_available, created_at, updated_at)
VALUES (8c7b7302-da49-4607-9dbc-5ccdfc20846f, 'yugioh', 'booster_pack', 'Phantom Nightmare Booster Pack', 'บูสเตอร์แพ็ค 9 ใบ รองรับ Fiendsmith และ Snake-Eye set ล่าสุดปี 2024', 180, 200, 'Mixed', 'Phantom Nightmare', 'PHNI-EN', '/images/yugioh/1778061175300-75507916.png', true, toTimestamp(now()), toTimestamp(now()));

-- [ID: 7ab30f93-58ba-44c0-91a3-a0eba9d83db5] Added/Updated via UI on 5/6/2026, 9:56:17 AM
INSERT INTO products (category, subcategory, product_id, name, description, price, stock_quantity, rarity, set_name, card_number, image_url, is_available, created_at, updated_at)
VALUES ('yugioh', 'general', 7ab30f93-58ba-44c0-91a3-a0eba9d83db5, 'มหาเวท คนดำ', 'ดำๆๆๆๆๆๆๆๆๆๆๆๆๆๆๆๆๆๆ', 0, 1, 'Secret Rare', '', '', '/images/yugioh/1778061377211-948565320.png', true, toTimestamp(now()), toTimestamp(now()));

INSERT INTO products_by_id (product_id, category, subcategory, name, description, price, stock_quantity, rarity, set_name, card_number, image_url, is_available, created_at, updated_at)
VALUES (7ab30f93-58ba-44c0-91a3-a0eba9d83db5, 'yugioh', 'general', 'มหาเวท คนดำ', 'ดำๆๆๆๆๆๆๆๆๆๆๆๆๆๆๆๆๆๆ', 0, 1, 'Secret Rare', '', '', '/images/yugioh/1778061377211-948565320.png', true, toTimestamp(now()), toTimestamp(now()));

-- [ID: 3b2a36b9-ad0f-4720-8e66-426ffb1c11ae] Added/Updated via UI on 5/6/2026, 9:56:47 AM
INSERT INTO products (category, subcategory, product_id, name, description, price, stock_quantity, rarity, set_name, card_number, image_url, is_available, created_at, updated_at)
VALUES ('yugioh', 'structure_deck', 3b2a36b9-ad0f-4720-8e66-426ffb1c11ae, 'Structure Deck: Dragon''s Roar', 'เด็ค 40 ใบพร้อมเล่น ธีมดราก้อน มีการ์ด Exclusive ที่หาจากที่อื่นไม่ได้', 490, 30, 'Common', 'Dragon''s Roar Structure Deck', 'SD1-EN', '/images/yugioh/1778061407028-686047329.png', true, toTimestamp(now()), toTimestamp(now()));

INSERT INTO products_by_id (product_id, category, subcategory, name, description, price, stock_quantity, rarity, set_name, card_number, image_url, is_available, created_at, updated_at)
VALUES (3b2a36b9-ad0f-4720-8e66-426ffb1c11ae, 'yugioh', 'structure_deck', 'Structure Deck: Dragon''s Roar', 'เด็ค 40 ใบพร้อมเล่น ธีมดราก้อน มีการ์ด Exclusive ที่หาจากที่อื่นไม่ได้', 490, 30, 'Common', 'Dragon''s Roar Structure Deck', 'SD1-EN', '/images/yugioh/1778061407028-686047329.png', true, toTimestamp(now()), toTimestamp(now()));

-- [ID: b1213173-cda8-48c3-9c2c-b36f960323be] Added/Updated via UI on 5/6/2026, 9:58:26 AM
INSERT INTO products (category, subcategory, product_id, name, description, price, stock_quantity, rarity, set_name, card_number, image_url, is_available, created_at, updated_at)
VALUES ('yugioh', 'monster_card', b1213173-cda8-48c3-9c2c-b36f960323be, 'Blue-Eyes White Dragon', 'ดราก้อนตำนาน ATK 3000 / DEF 2500 การ์ดไอคอนิคของ Seto Kaiba จากยุค DM เป็นหนึ่งในการ์ดที่มีมูลค่าสะสมสูงที่สุดในประวัติศาสตร์ TCG', 3500, 5, 'Secret Rare', 'Legend of Blue Eyes White Dragon', 'LOB-EN001', '/images/yugioh/1778061505836-327852971.png', true, toTimestamp(now()), toTimestamp(now()));

INSERT INTO products_by_id (product_id, category, subcategory, name, description, price, stock_quantity, rarity, set_name, card_number, image_url, is_available, created_at, updated_at)
VALUES (b1213173-cda8-48c3-9c2c-b36f960323be, 'yugioh', 'monster_card', 'Blue-Eyes White Dragon', 'ดราก้อนตำนาน ATK 3000 / DEF 2500 การ์ดไอคอนิคของ Seto Kaiba จากยุค DM เป็นหนึ่งในการ์ดที่มีมูลค่าสะสมสูงที่สุดในประวัติศาสตร์ TCG', 3500, 5, 'Secret Rare', 'Legend of Blue Eyes White Dragon', 'LOB-EN001', '/images/yugioh/1778061505836-327852971.png', true, toTimestamp(now()), toTimestamp(now()));

-- [ID: dae0a5b6-dd3b-4a40-8e47-a9f1b1494c01] Added/Updated via UI on 5/6/2026, 9:59:00 AM
INSERT INTO products (category, subcategory, product_id, name, description, price, stock_quantity, rarity, set_name, card_number, image_url, is_available, created_at, updated_at)
VALUES ('yugioh', 'extra_deck', dae0a5b6-dd3b-4a40-8e47-a9f1b1494c01, 'Stardust Dragon', 'Level 8 Synchro — Negate ทำลายการ์ดบนสนาม การ์ดซิกเนเจอร์ของ Yusei Fudo จาก Yu-Gi-Oh! 5Ds', 1200, 8, 'Ultra Rare', 'The Duelist Genesis', 'TDGS-EN040', '/images/yugioh/1778061540520-139345869.png', true, toTimestamp(now()), toTimestamp(now()));

INSERT INTO products_by_id (product_id, category, subcategory, name, description, price, stock_quantity, rarity, set_name, card_number, image_url, is_available, created_at, updated_at)
VALUES (dae0a5b6-dd3b-4a40-8e47-a9f1b1494c01, 'yugioh', 'extra_deck', 'Stardust Dragon', 'Level 8 Synchro — Negate ทำลายการ์ดบนสนาม การ์ดซิกเนเจอร์ของ Yusei Fudo จาก Yu-Gi-Oh! 5Ds', 1200, 8, 'Ultra Rare', 'The Duelist Genesis', 'TDGS-EN040', '/images/yugioh/1778061540520-139345869.png', true, toTimestamp(now()), toTimestamp(now()));

-- [ID: 8ef58cf2-be35-4c46-82cc-954aa07df7ad] Added/Updated via UI on 5/6/2026, 10:25:54 AM
INSERT INTO products (category, subcategory, product_id, name, description, price, stock_quantity, rarity, set_name, card_number, image_url, is_available, created_at, updated_at)
VALUES ('yugioh', 'monster_card', 8ef58cf2-be35-4c46-82cc-954aa07df7ad, 'Black Luster Soldier', 'ข ข ข ข ข แข็งงงงงงงงงงงงง', 300000000, 1, 'Secret Rare', 'Stainless Steel', '--', '/images/yugioh/1778063154271-948395699.png', true, toTimestamp(now()), toTimestamp(now()));

INSERT INTO products_by_id (product_id, category, subcategory, name, description, price, stock_quantity, rarity, set_name, card_number, image_url, is_available, created_at, updated_at)
VALUES (8ef58cf2-be35-4c46-82cc-954aa07df7ad, 'yugioh', 'monster_card', 'Black Luster Soldier', 'ข ข ข ข ข แข็งงงงงงงงงงงงง', 300000000, 1, 'Secret Rare', 'Stainless Steel', '--', '/images/yugioh/1778063154271-948395699.png', true, toTimestamp(now()), toTimestamp(now()));

-- [ID: 10655f5c-a2cf-478b-8311-e068e971d18c] Added/Updated via UI on 5/6/2026, 10:31:45 AM
INSERT INTO products (category, subcategory, product_id, name, description, price, stock_quantity, rarity, set_name, card_number, image_url, is_available, created_at, updated_at)
VALUES ('yugioh', 'spell_card', 10655f5c-a2cf-478b-8311-e068e971d18c, 'Pot of Greed', 'ใครๆก็รู้จัก', 10, 1000000000, 'Common', 'Legend of Blue Eyes White Dragon', '55144522', '/images/yugioh/1778063490595-354282077.png', true, toTimestamp(now()), toTimestamp(now()));

INSERT INTO products_by_id (product_id, category, subcategory, name, description, price, stock_quantity, rarity, set_name, card_number, image_url, is_available, created_at, updated_at)
VALUES (10655f5c-a2cf-478b-8311-e068e971d18c, 'yugioh', 'spell_card', 'Pot of Greed', 'ใครๆก็รู้จัก', 10, 1000000000, 'Common', 'Legend of Blue Eyes White Dragon', '55144522', '/images/yugioh/1778063490595-354282077.png', true, toTimestamp(now()), toTimestamp(now()));
