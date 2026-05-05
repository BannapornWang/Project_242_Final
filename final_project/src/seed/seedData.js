const client = require('../config/cassandra');
const Product = require('../models/Product');

async function seed() {
  console.log('Connecting to Cassandra...');
  await client.connect();

  const sampleProducts = [
    // ===== Yu-Gi-Oh! =====
    {
      category: 'yugioh', subcategory: 'monster_card',
      name: 'Blue-Eyes White Dragon', description: 'ดราก้อนตำนาน ATK 3000 / DEF 2500 การ์ดไอคอนิคของ Seto Kaiba จากยุค DM เป็นหนึ่งในการ์ดที่มีมูลค่าสะสมสูงที่สุดในประวัติศาสตร์ TCG',
      price: 3500.00, stock_quantity: 5, rarity: 'Secret Rare', set_name: 'Legend of Blue Eyes White Dragon', card_number: 'LOB-EN001',
      image_url: '/images/cards/blue_eyes.png'
    },
    {
      category: 'yugioh', subcategory: 'spell_card',
      name: 'Monster Reborn', description: 'Special Summon มอนสเตอร์จาก Graveyard ฝั่งใดก็ได้ — การ์ดมนตราระดับตำนานที่ถูก Ban/Limit มาตลอดประวัติศาสตร์',
      price: 850.00, stock_quantity: 12, rarity: 'Super Rare', set_name: 'Metal Raiders', card_number: 'MRD-EN065',
      image_url: ''
    },
    {
      category: 'yugioh', subcategory: 'booster_pack',
      name: 'Phantom Nightmare Booster Pack', description: 'บูสเตอร์แพ็ค 9 ใบ รองรับ Fiendsmith และ Snake-Eye set ล่าสุดปี 2024',
      price: 180.00, stock_quantity: 200, rarity: 'Mixed', set_name: 'Phantom Nightmare', card_number: 'PHNI-EN',
      image_url: ''
    },
    {
      category: 'yugioh', subcategory: 'extra_deck',
      name: 'Stardust Dragon', description: 'Level 8 Synchro — Negate ทำลายการ์ดบนสนาม การ์ดซิกเนเจอร์ของ Yusei Fudo จาก Yu-Gi-Oh! 5Ds',
      price: 1200.00, stock_quantity: 8, rarity: 'Ultra Rare', set_name: 'The Duelist Genesis', card_number: 'TDGS-EN040',
      image_url: ''
    },
    {
      category: 'yugioh', subcategory: 'structure_deck',
      name: "Structure Deck: Dragon's Roar", description: 'เด็ค 40 ใบพร้อมเล่น ธีมดราก้อน มีการ์ด Exclusive ที่หาจากที่อื่นไม่ได้',
      price: 490.00, stock_quantity: 30, rarity: 'Common', set_name: "Dragon's Roar Structure Deck", card_number: 'SD1-EN',
      image_url: ''
    },
    // ===== Vanguard =====
    {
      category: 'vanguard', subcategory: 'grade_3_unit',
      name: 'Blaster Blade', description: 'Grade 3 Royal Paladin พลัง 10000 — On Ride: ทำลาย rear-guard ฝ่ายตรงข้าม 1 ตัว การ์ดซิกเนเจอร์ของ Aichi Sendou',
      price: 750.00, stock_quantity: 10, rarity: 'Rare', set_name: 'Cardfight!! Vanguard V Vol.01', card_number: 'V-BT01/006EN',
      image_url: '/images/cards/blaster_blade.png'
    },
    {
      category: 'vanguard', subcategory: 'trigger_unit',
      name: 'Bringer of Good Luck, Epona', description: 'Grade 0 Critical Trigger พลัง 5000 / Shield 30000 จำเป็นสำหรับเด็ค Royal Paladin',
      price: 220.00, stock_quantity: 40, rarity: 'Common', set_name: 'V Extra Booster 16', card_number: 'V-EB16/030EN',
      image_url: ''
    },
    {
      category: 'vanguard', subcategory: 'booster_set',
      name: 'V Booster Set 12: Divine Lightning Radiance', description: '7 ใบต่อแพ็ค รองรับ Oracle Think Tank และ Narukami',
      price: 160.00, stock_quantity: 150, rarity: 'Mixed', set_name: 'Divine Lightning Radiance', card_number: 'V-BT12-EN',
      image_url: ''
    },
    {
      category: 'vanguard', subcategory: 'trial_deck',
      name: 'Trial Deck: Royal Paladin — Blaster Blade Edition', description: 'เด็ค 50 ใบพร้อมเล่นสำหรับผู้เริ่มต้น มี RR 2 ใบ',
      price: 590.00, stock_quantity: 25, rarity: 'Common', set_name: 'V Trial Deck 01', card_number: 'V-TD01-EN',
      image_url: ''
    },
    // ===== MLP =====
    {
      category: 'mlp', subcategory: 'starter_deck',
      name: 'Applejack Starter Deck', description: 'เด็ค 59 ใบพร้อมเล่น ธีม Applejack จาก Premiere! Starter Decks',
      price: 450.00, stock_quantity: 15, rarity: 'Common', set_name: 'Premiere! Starter Decks', card_number: 'SD-AJ',
      image_url: '/images/MLP/Applejack_SD.jpg'
    },
    {
      category: 'mlp', subcategory: 'starter_deck',
      name: 'Twilight Sparkle Starter Deck', description: 'เด็ค 59 ใบพร้อมเล่น ธีม Twilight Sparkle ตัวละครหลักของซีรีส์',
      price: 450.00, stock_quantity: 25, rarity: 'Common', set_name: 'Premiere! Starter Decks', card_number: 'SD-TS',
      image_url: '/images/MLP/TwilightSparkle_SD.jpg'
    },
    {
      category: 'mlp', subcategory: 'starter_deck',
      name: 'Rainbow Dash Starter Deck', description: 'เด็ค 59 ใบพร้อมเล่น ธีม Rainbow Dash',
      price: 450.00, stock_quantity: 18, rarity: 'Common', set_name: 'Premiere! Starter Decks', card_number: 'SD-RD',
      image_url: '/images/MLP/RainbowDash_SD.jpg'
    },
    {
      category: 'mlp', subcategory: 'starter_deck',
      name: 'Fluttershy Starter Deck', description: 'เด็ค 59 ใบพร้อมเล่น ธีม Fluttershy',
      price: 450.00, stock_quantity: 12, rarity: 'Common', set_name: 'Premiere! Starter Decks', card_number: 'SD-FS',
      image_url: '/images/MLP/Fluttershy_SD.jpg'
    },
    {
      category: 'mlp', subcategory: 'starter_deck',
      name: 'Pinkie Pie Starter Deck', description: 'เด็ค 59 ใบพร้อมเล่น ธีม Pinkie Pie',
      price: 450.00, stock_quantity: 20, rarity: 'Common', set_name: 'Premiere! Starter Decks', card_number: 'SD-PP',
      image_url: '/images/MLP/PinkiePie_SD.jpg'
    },
    {
      category: 'mlp', subcategory: 'starter_deck',
      name: 'Rarity Starter Deck', description: 'เด็ค 59 ใบพร้อมเล่น ธีม Rarity',
      price: 450.00, stock_quantity: 10, rarity: 'Common', set_name: 'Premiere! Starter Decks', card_number: 'SD-RR',
      image_url: '/images/MLP/Rarity_SD.jpg'
    },
    // ===== Gundam =====
    {
      category: 'gundam', subcategory: 'starter_deck',
      name: 'Generation Pulse Starter Deck', description: 'Starter Deck [ST10] จากซีรีส์ Gundam Card Game',
      price: 550.00, stock_quantity: 10, rarity: 'Common', set_name: 'Gundam Starter Decks', card_number: 'ST10',
      image_url: '/images/GUNDUM/Generation Pulse [ST10].png'
    },
    {
      category: 'gundam', subcategory: 'starter_deck',
      name: 'Destiny Ignition Starter Deck', description: 'Starter Deck [ST09]',
      price: 550.00, stock_quantity: 10, rarity: 'Common', set_name: 'Gundam Starter Decks', card_number: 'ST09',
      image_url: '/images/GUNDUM/Destiny Ignition [ST09].png'
    },
    {
      category: 'gundam', subcategory: 'starter_deck',
      name: 'Heroic Beginnings Starter Deck', description: 'Starter Deck [ST01] — เด็คแรกของซีรีส์',
      price: 550.00, stock_quantity: 10, rarity: 'Common', set_name: 'Gundam Starter Decks', card_number: 'ST01',
      image_url: '/images/GUNDUM/Heroic Beginnings [ST01].png'
    }
  ];

  console.log(`Seeding ${sampleProducts.length} cards into database...`);
  
  for (const prod of sampleProducts) {
    const id = await Product.create(prod);
    console.log(`Seeded: ${prod.name} with ID: ${id}`);
  }

  console.log('Seed completed successfully.');
  process.exit(0);
}

seed().catch(err => {
  console.error('Seed error:', err);
  process.exit(1);
});
