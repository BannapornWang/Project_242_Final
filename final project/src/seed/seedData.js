const client = require('../config/cassandra');
const Product = require('../models/Product');

async function seed() {
  console.log('Connecting to Cassandra...');
  await client.connect();

  const sampleProducts = [
    { category: 'yugioh', subcategory: 'monster_card', name: 'Dark Magician', description: 'The ultimate wizard in terms of attack and defense.', price: 1500.00, stock_quantity: 10, rarity: 'Ultra Rare', set_name: 'Legend of Blue Eyes White Dragon', card_number: 'LOB-005', image_url: 'http://example.com/dark-magician.jpg' },
    { category: 'vanguard', subcategory: 'grade_3_unit', name: 'Dragonic Overlord', description: 'Flame dragon of the Kagero clan.', price: 850.00, stock_quantity: 4, rarity: 'Rare', set_name: 'Descent of the King of Knights', card_number: 'BT01/004EN', image_url: 'http://example.com/dragonic-overlord.jpg' },
    { category: 'mlp', subcategory: 'mane_character', name: 'Rainbow Dash', description: 'Fastest flier in Equestria.', price: 600.00, stock_quantity: 15, rarity: 'Super Rare', set_name: 'Premiere! MLP CCG', card_number: 'Mane-003', image_url: 'http://example.com/rainbow-dash.jpg' },
    { category: 'gundam', subcategory: 'mobile_suit', name: 'Zaku II (Char Custom)', description: 'Three times faster.', price: 1200.00, stock_quantity: 2, rarity: 'Secret Rare', set_name: 'Universal Century', card_number: 'UC-002', image_url: 'http://example.com/char-zaku.jpg' },
  ];

  console.log('Seeding products...');
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
