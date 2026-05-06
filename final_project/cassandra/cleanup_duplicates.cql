USE trading_card_shop;

-- =============================================================================
-- Cleanup: Remove duplicate entries
-- Yu-Gi-Oh: keep only a8d047f1-4d96-4f40-b78d-01025c2d9a77 (Blue eye white dargon)
-- Vanguard: keep only 7c9e9b96-dbe4-49c3-8c2a-075dd5a73813 (Blaster Blade Liberity)
--           and       09af1d85-0845-411b-827e-34c343d9bed6 (Youthberk "Skyfall Arms")
-- =============================================================================

-- -------------------------------------------------------
-- DELETE Yu-Gi-Oh duplicates
-- -------------------------------------------------------

-- Original batch seed: Blue-Eyes White Dragon (monster_card)
DELETE FROM products WHERE category = 'yugioh' AND subcategory = 'monster_card' AND product_id = 33333333-3333-3333-3333-333333333333;
DELETE FROM products_by_id WHERE product_id = 33333333-3333-3333-3333-333333333333;

-- 6:05 batch duplicate: Blue-Eyes White Dragon (monster_card)
DELETE FROM products WHERE category = 'yugioh' AND subcategory = 'monster_card' AND product_id = 0323e152-e7f2-4c82-98ac-d1253aad7edd;
DELETE FROM products_by_id WHERE product_id = 0323e152-e7f2-4c82-98ac-d1253aad7edd;

-- 6:05 batch: Monster Reborn (spell_card)
DELETE FROM products WHERE category = 'yugioh' AND subcategory = 'spell_card' AND product_id = 771d5dcd-43c6-4100-b511-2bee9a91ac4b;
DELETE FROM products_by_id WHERE product_id = 771d5dcd-43c6-4100-b511-2bee9a91ac4b;

-- 6:05 batch: Phantom Nightmare Booster Pack (booster_pack)
DELETE FROM products WHERE category = 'yugioh' AND subcategory = 'booster_pack' AND product_id = e6166c6b-6f0b-4408-bf52-f8bf10e19532;
DELETE FROM products_by_id WHERE product_id = e6166c6b-6f0b-4408-bf52-f8bf10e19532;

-- 6:05 batch: Stardust Dragon (extra_deck)
DELETE FROM products WHERE category = 'yugioh' AND subcategory = 'extra_deck' AND product_id = c2649e31-2f4a-4b87-90d0-4c99fa7360c8;
DELETE FROM products_by_id WHERE product_id = c2649e31-2f4a-4b87-90d0-4c99fa7360c8;

-- 6:05 batch: Structure Deck (structure_deck)
DELETE FROM products WHERE category = 'yugioh' AND subcategory = 'structure_deck' AND product_id = 2a7340d0-27be-4cb8-8838-6f9381c46486;
DELETE FROM products_by_id WHERE product_id = 2a7340d0-27be-4cb8-8838-6f9381c46486;

-- 6:30 batch duplicate: Blue-Eyes White Dragon (monster_card)
DELETE FROM products WHERE category = 'yugioh' AND subcategory = 'monster_card' AND product_id = d32b25c7-8620-4668-9dd7-546904a21b91;
DELETE FROM products_by_id WHERE product_id = d32b25c7-8620-4668-9dd7-546904a21b91;

-- 6:30 batch: Monster Reborn (spell_card)
DELETE FROM products WHERE category = 'yugioh' AND subcategory = 'spell_card' AND product_id = af8306aa-48d3-4c5a-bbaa-0488809302ba;
DELETE FROM products_by_id WHERE product_id = af8306aa-48d3-4c5a-bbaa-0488809302ba;

-- 6:30 batch: Phantom Nightmare Booster Pack (booster_pack)
DELETE FROM products WHERE category = 'yugioh' AND subcategory = 'booster_pack' AND product_id = ad90bbe1-e9bf-49a6-b510-81ae75727b37;
DELETE FROM products_by_id WHERE product_id = ad90bbe1-e9bf-49a6-b510-81ae75727b37;

-- 6:30 batch: Stardust Dragon (extra_deck)
DELETE FROM products WHERE category = 'yugioh' AND subcategory = 'extra_deck' AND product_id = 9aa2285a-31ea-45b9-8619-937ac5e92cd8;
DELETE FROM products_by_id WHERE product_id = 9aa2285a-31ea-45b9-8619-937ac5e92cd8;

-- 6:30 batch: Structure Deck (structure_deck)
DELETE FROM products WHERE category = 'yugioh' AND subcategory = 'structure_deck' AND product_id = 238b06ad-5721-4bf9-9fbf-9cc370f251ec;
DELETE FROM products_by_id WHERE product_id = 238b06ad-5721-4bf9-9fbf-9cc370f251ec;

-- -------------------------------------------------------
-- DELETE Vanguard duplicates (keep 7c9e9b96 and 09af1d85)
-- -------------------------------------------------------

-- Original batch seed: Blaster Blade (grade_3_unit)
DELETE FROM products WHERE category = 'vanguard' AND subcategory = 'grade_3_unit' AND product_id = 44444444-4444-4444-4444-444444444444;
DELETE FROM products_by_id WHERE product_id = 44444444-4444-4444-4444-444444444444;

-- 6:05 batch: Blaster Blade (grade_3_unit)
DELETE FROM products WHERE category = 'vanguard' AND subcategory = 'grade_3_unit' AND product_id = 6c90aad1-b57e-4e06-90db-f832269a114d;
DELETE FROM products_by_id WHERE product_id = 6c90aad1-b57e-4e06-90db-f832269a114d;

-- 6:05 batch: Epona (trigger_unit)
DELETE FROM products WHERE category = 'vanguard' AND subcategory = 'trigger_unit' AND product_id = 68abf949-ec18-4547-b594-eca954c12644;
DELETE FROM products_by_id WHERE product_id = 68abf949-ec18-4547-b594-eca954c12644;

-- 6:05 batch: V Booster Set 12 (booster_set)
DELETE FROM products WHERE category = 'vanguard' AND subcategory = 'booster_set' AND product_id = 95a7fe53-10cd-40b2-9fb2-2bf33c058ad8;
DELETE FROM products_by_id WHERE product_id = 95a7fe53-10cd-40b2-9fb2-2bf33c058ad8;

-- 6:05 batch: Trial Deck (trial_deck)
DELETE FROM products WHERE category = 'vanguard' AND subcategory = 'trial_deck' AND product_id = 67f66332-94c2-47ce-aa3f-73ba4a1eaf2b;
DELETE FROM products_by_id WHERE product_id = 67f66332-94c2-47ce-aa3f-73ba4a1eaf2b;

-- 6:30 batch: Blaster Blade (grade_3_unit)
DELETE FROM products WHERE category = 'vanguard' AND subcategory = 'grade_3_unit' AND product_id = 05e58b3b-6ccb-4cb6-82b8-65abc75221cd;
DELETE FROM products_by_id WHERE product_id = 05e58b3b-6ccb-4cb6-82b8-65abc75221cd;

-- 6:30 batch: Epona (trigger_unit)
DELETE FROM products WHERE category = 'vanguard' AND subcategory = 'trigger_unit' AND product_id = 777399cb-bad7-4d9c-8da5-a99769156c4d;
DELETE FROM products_by_id WHERE product_id = 777399cb-bad7-4d9c-8da5-a99769156c4d;

-- 6:30 batch: V Booster Set 12 (booster_set)
DELETE FROM products WHERE category = 'vanguard' AND subcategory = 'booster_set' AND product_id = fba70ee1-3626-4485-89e7-d2754dd85393;
DELETE FROM products_by_id WHERE product_id = fba70ee1-3626-4485-89e7-d2754dd85393;

-- 6:30 batch: Trial Deck (trial_deck)
DELETE FROM products WHERE category = 'vanguard' AND subcategory = 'trial_deck' AND product_id = 6c2e3b97-a3f1-4dde-9ea9-91f4e811cc72;
DELETE FROM products_by_id WHERE product_id = 6c2e3b97-a3f1-4dde-9ea9-91f4e811cc72;
