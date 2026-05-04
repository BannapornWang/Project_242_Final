const client = require('../config/cassandra');
const Product = require('../models/Product');

async function seed() {
  console.log('Connecting to Cassandra...');
  await client.connect();

  const sampleProducts = [
    {
      category: 'yugioh', subcategory: 'monster_card',
      name: 'Blue-Eyes White Dragon', description: 'The ultimate dragon with 3000 ATK / 2500 DEF. A classic must-have for any Yugioh collector.',
      price: 3500.00, stock_quantity: 5, rarity: 'Secret Rare', set_name: 'Legend of Blue Eyes White Dragon', card_number: 'LOB-EN001',
      image_url: '/images/cards/blue_eyes.png'
    },
    {
      category: 'yugioh', subcategory: 'spell_card',
      name: 'Monster Reborn', description: "Special Summon any monster from either graveyard. One of Yugioh's most iconic spell cards.",
      price: 850.00, stock_quantity: 12, rarity: 'Super Rare', set_name: 'Metal Raiders', card_number: 'MRD-EN065',
      image_url: 'https://cdn.tcgshop.th/yugioh/mrd-en065.jpg'
    },
    {
      category: 'yugioh', subcategory: 'booster_pack',
      name: 'Phantom Nightmare Booster Pack', description: '9 cards per pack. Introduces new Fiendsmith and Snake-Eye support. Latest 2024 set.',
      price: 180.00, stock_quantity: 200, rarity: 'Mixed', set_name: 'Phantom Nightmare', card_number: 'PHNI-EN',
      image_url: 'https://cdn.tcgshop.th/yugioh/phni-booster.jpg'
    },
    {
      category: 'yugioh', subcategory: 'extra_deck',
      name: 'Stardust Dragon', description: 'Level 8 Synchro. Negate and destroy any card or effect that would destroy a card on the field.',
      price: 1200.00, stock_quantity: 8, rarity: 'Ultra Rare', set_name: 'The Duelist Genesis', card_number: 'TDGS-EN040',
      image_url: 'https://cdn.tcgshop.th/yugioh/tdgs-en040.jpg'
    },
    {
      category: 'yugioh', subcategory: 'structure_deck',
      name: "Structure Deck: Dragon's Roar", description: 'Ready-to-play 40-card deck focused on dragon-type monsters. Includes exclusive cards.',
      price: 490.00, stock_quantity: 30, rarity: 'Common', set_name: "Dragon's Roar Structure Deck", card_number: 'SD1-EN',
      image_url: 'https://cdn.tcgshop.th/yugioh/sd1-structure.jpg'
    },
    {
      category: 'vanguard', subcategory: 'grade_3_unit',
      name: 'Blaster Blade', description: "Grade 3 Royal Paladin. Power 10000. On Ride: retire one of opponent's rear-guards.",
      price: 750.00, stock_quantity: 10, rarity: 'Rare', set_name: 'Cardfight!! Vanguard V Vol.01', card_number: 'V-BT01/006EN',
      image_url: '/images/cards/blaster_blade.png'
    },
    {
      category: 'vanguard', subcategory: 'trigger_unit',
      name: 'Bringer of Good Luck, Epona', description: 'Grade 0 Critical Trigger. Power 5000 / Shield 30000. Essential for Royal Paladin builds.',
      price: 220.00, stock_quantity: 40, rarity: 'Common', set_name: 'V Extra Booster 16', card_number: 'V-EB16/030EN',
      image_url: 'https://cdn.tcgshop.th/vanguard/veb16-030.jpg'
    },
    {
      category: 'vanguard', subcategory: 'booster_set',
      name: 'V Booster Set 12: Divine Lightning Radiance Booster Pack', description: '7 cards per pack. Features Oracle Think Tank and Narukami clans.',
      price: 160.00, stock_quantity: 150, rarity: 'Mixed', set_name: 'Divine Lightning Radiance', card_number: 'V-BT12-EN',
      image_url: 'https://cdn.tcgshop.th/vanguard/vbt12-booster.jpg'
    },
    {
      category: 'vanguard', subcategory: 'trial_deck',
      name: 'Trial Deck: Royal Paladin — Blaster Blade Edition', description: '50-card ready-to-play deck for new players. Includes 2 Royal Paladin RR cards.',
      price: 590.00, stock_quantity: 25, rarity: 'Common', set_name: 'V Trial Deck 01', card_number: 'V-TD01-EN',
      image_url: 'https://cdn.tcgshop.th/vanguard/vtd01-deck.jpg'
    },
    {
      category: 'mlp', subcategory: 'starter_deck',
      name: 'Applejack Starter Deck', description: 'Ready-to-play 59-card deck featuring Applejack. Great for beginners!',
      price: 450.00, stock_quantity: 15, rarity: 'Common', set_name: 'Premiere! Starter Decks', card_number: 'SD-AJ',
      image_url: '/images/MLP/Applejack_SD.jpg'
    },
    {
      category: 'mlp', subcategory: 'starter_deck',
      name: 'Fluttershy Starter Deck', description: 'Ready-to-play 59-card deck featuring Fluttershy. Great for beginners!',
      price: 450.00, stock_quantity: 12, rarity: 'Common', set_name: 'Premiere! Starter Decks', card_number: 'SD-FS',
      image_url: '/images/MLP/Fluttershy_SD.jpg'
    },
    {
      category: 'mlp', subcategory: 'starter_deck',
      name: 'Pinkie Pie Starter Deck', description: 'Ready-to-play 59-card deck featuring Pinkie Pie. Great for beginners!',
      price: 450.00, stock_quantity: 20, rarity: 'Common', set_name: 'Premiere! Starter Decks', card_number: 'SD-PP',
      image_url: '/images/MLP/PinkiePie_SD.jpg'
    },
    {
      category: 'mlp', subcategory: 'starter_deck',
      name: 'Rainbow Dash Starter Deck', description: 'Ready-to-play 59-card deck featuring Rainbow Dash. Great for beginners!',
      price: 450.00, stock_quantity: 18, rarity: 'Common', set_name: 'Premiere! Starter Decks', card_number: 'SD-RD',
      image_url: '/images/MLP/RainbowDash_SD.jpg'
    },
    {
      category: 'mlp', subcategory: 'starter_deck',
      name: 'Rarity Starter Deck', description: 'Ready-to-play 59-card deck featuring Rarity. Great for beginners!',
      price: 450.00, stock_quantity: 10, rarity: 'Common', set_name: 'Premiere! Starter Decks', card_number: 'SD-RR',
      image_url: '/images/MLP/Rarity_SD.jpg'
    },
    {
      category: 'mlp', subcategory: 'starter_deck',
      name: 'Twilight Sparkle Starter Deck', description: 'Ready-to-play 59-card deck featuring Twilight Sparkle. Great for beginners!',
      price: 450.00, stock_quantity: 25, rarity: 'Common', set_name: 'Premiere! Starter Decks', card_number: 'SD-TS',
      image_url: '/images/MLP/TwilightSparkle_SD.jpg'
    },
    {
      category: 'gundam', subcategory: 'mobile_suit',
      name: 'RX-78-2 Gundam Mobile Suit Card', description: 'The original Gundam. Power 6000. Special ability: Beam Rifle deals 3 damage to target unit.',
      price: 1100.00, stock_quantity: 14, rarity: 'Super Rare', set_name: 'Gundam Card Game: Universal Century Vol.1', card_number: 'UC01-001',
      image_url: '/images/cards/gundam_rx78.png'
    },
    {
      category: 'gundam', subcategory: 'pilot_card',
      name: 'Amuro Ray — Newtype Pilot', description: 'Pilot card. When paired with RX-78-2: +2000 power, add Newtype Sensing reaction ability.',
      price: 890.00, stock_quantity: 9, rarity: 'Rare', set_name: 'Gundam Card Game: Universal Century Vol.1', card_number: 'UC01-025',
      image_url: 'https://cdn.tcgshop.th/gundam/uc01-025-amuro.jpg'
    },
    {
      category: 'gundam', subcategory: 'unit_card',
      name: 'Zaku II (Mass Production Type)', description: 'Zeon unit card. Power 3000. Field ability: deploy two Zaku tokens when this unit attacks.',
      price: 390.00, stock_quantity: 22, rarity: 'Common', set_name: 'Gundam Card Game: Zeon Rising', card_number: 'ZR01-018',
      image_url: 'https://cdn.tcgshop.th/gundam/zr01-018-zakuii.jpg'
    }
  ];

  console.log(`Seeding ${sampleProducts.length} real products from seed_data.cql...`);
  
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
