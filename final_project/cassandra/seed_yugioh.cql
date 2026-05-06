USE trading_card_shop;

-- =============================================================================
-- 3. Yu-Gi-Oh! (Featured Cards)
-- =============================================================================

-- Added via UI on 5/6/2026, 5:42:11 AM
INSERT INTO products (category, subcategory, product_id, name, description, price, stock_quantity, rarity, set_name, card_number, image_url, is_available, created_at, updated_at)
VALUES ('yugioh', 'general', a8d047f1-4d96-4f40-b78d-01025c2d9a77, 'Blue eye white- dargon', 'blue eye ตัวใหญ่มาก', 1, 30, 'Mixed', 'pokemon go', 'DBT-09', '/images/yugioh/1778046039642-694973318.jpg', true, toTimestamp(now()), toTimestamp(now()));

INSERT INTO products_by_id (product_id, category, subcategory, name, description, price, stock_quantity, rarity, set_name, card_number, image_url, is_available, created_at, updated_at)
VALUES (a8d047f1-4d96-4f40-b78d-01025c2d9a77, 'yugioh', 'general', 'Blue eye white- dargon', 'blue eye ตัวใหญ่มาก', 1, 30, 'Mixed', 'pokemon go', 'DBT-09', '/images/yugioh/1778046039642-694973318.jpg', true, toTimestamp(now()), toTimestamp(now()));
