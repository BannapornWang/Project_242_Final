const client = require('../config/cassandra');
const cassandra = require('cassandra-driver');

class Product {
  // CREATE — Batch INSERT into both denormalized tables
  static async create(data) {
    const id = cassandra.types.Uuid.random();
    
    const query1 = `
      INSERT INTO products (category, subcategory, product_id, name, description, price, stock_quantity, rarity, set_name, card_number, image_url, is_available, created_at, updated_at)
      VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, toTimestamp(now()), toTimestamp(now()))
    `;
    const params1 = [
      data.category, data.subcategory || 'general', id, data.name, data.description || '', data.price,
      data.stock_quantity, data.rarity || 'Common', data.set_name || '', data.card_number || '',
      data.image_url || '', true
    ];

    const query2 = `
      INSERT INTO products_by_id (product_id, category, subcategory, name, description, price, stock_quantity, rarity, set_name, card_number, image_url, is_available, created_at, updated_at)
      VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, toTimestamp(now()), toTimestamp(now()))
    `;
    const params2 = [
      id, data.category, data.subcategory || 'general', data.name, data.description || '', data.price,
      data.stock_quantity, data.rarity || 'Common', data.set_name || '', data.card_number || '',
      data.image_url || '', true
    ];

    console.log(`\n[CQL EXECUTE] CREATE PRODUCT`);
    console.log(`Query 1: ${query1.trim()}`);
    console.log(`Query 2: ${query2.trim()}`);
    
    const queries = [
      { query: query1, params: params1 },
      { query: query2, params: params2 }
    ];
    await client.batch(queries, { prepare: true });
    return id.toString();
  }

  // GET ALL BY CATEGORY (AND OPTIONAL SUBCATEGORY)
  static async getByCategory(category, subcategory) {
    let query, params;
    if (subcategory) {
      query = 'SELECT * FROM products WHERE category = ? AND subcategory = ?';
      params = [category, subcategory];
    } else {
      query = 'SELECT * FROM products WHERE category = ? ALLOW FILTERING';
      params = [category];
    }
    console.log(`\n[CQL EXECUTE] GET BY CATEGORY`);
    console.log(`Query: ${query}`);
    const result = await client.execute(query, params, { prepare: true });
    return result.rows;
  }

  // GET BY ID
  static async getById(id) {
    const query = 'SELECT * FROM products_by_id WHERE product_id = ?';
    console.log(`\n[CQL EXECUTE] GET BY ID`);
    console.log(`Query: ${query}`);
    const result = await client.execute(query, [id], { prepare: true });
    return result.rows[0];
  }

  // SEARCH BY NAME — In-memory filter (Cassandra doesn't support LIKE natively)
  static async searchByName(name) {
    const query = 'SELECT * FROM products_by_id LIMIT 1000';
    console.log(`\n[CQL EXECUTE] SEARCH BY NAME (In-Memory Filter)`);
    console.log(`Query: ${query}`);
    const result = await client.execute(query, [], { prepare: true });
    if (!name || !name.trim()) return result.rows;
    const lowerName = name.toLowerCase();
    return result.rows.filter(row => row.name.toLowerCase().includes(lowerName));
  }

  // LOW STOCK
  static async getLowStock() {
    const query = 'SELECT * FROM products_by_id WHERE stock_quantity < 5 ALLOW FILTERING';
    console.log(`\n[CQL EXECUTE] GET LOW STOCK`);
    console.log(`Query: ${query}`);
    const result = await client.execute(query, [], { prepare: true });
    return result.rows;
  }

  // UPDATE — Lightweight Transactions (IF EXISTS) on both tables
  static async update(id, data) {
    const existing = await this.getById(id);
    if (!existing) return null;

    const price = data.price !== undefined ? data.price : existing.price;
    const stock = data.stock_quantity !== undefined ? data.stock_quantity : existing.stock_quantity;
    const desc = data.description !== undefined ? data.description : existing.description;
    const imageUrl = data.image_url !== undefined ? data.image_url : existing.image_url;
    const avail = data.is_available !== undefined ? data.is_available : existing.is_available;

    const query1 = `
      UPDATE products_by_id 
      SET price = ?, stock_quantity = ?, description = ?, image_url = ?, is_available = ?, updated_at = toTimestamp(now())
      WHERE product_id = ? IF EXISTS
    `;
    const params1 = [price, stock, desc, imageUrl, avail, id];

    const query2 = `
      UPDATE products 
      SET price = ?, stock_quantity = ?, description = ?, image_url = ?, is_available = ?, updated_at = toTimestamp(now())
      WHERE category = ? AND subcategory = ? AND product_id = ? IF EXISTS
    `;
    const params2 = [price, stock, desc, imageUrl, avail, existing.category, existing.subcategory, id];

    console.log(`\n[CQL EXECUTE] UPDATE PRODUCT (LWT)`);
    console.log(`Query 1 (products_by_id): ${query1.trim()}`);
    console.log(`Query 2 (products): ${query2.trim()}`);
    
    // Execute LWT queries separately (batching LWT across partitions is unsupported)
    await client.execute(query1, params1, { prepare: true });
    await client.execute(query2, params2, { prepare: true });
    
    return this.getById(id);
  }

  // SOFT DELETE
  static async softDelete(id) {
    const existing = await this.getById(id);
    if (!existing) return null;

    const query1 = `UPDATE products_by_id SET is_available = false WHERE product_id = ? IF EXISTS`;
    const query2 = `UPDATE products SET is_available = false WHERE category = ? AND subcategory = ? AND product_id = ? IF EXISTS`;
    
    console.log(`\n[CQL EXECUTE] SOFT DELETE PRODUCT`);
    console.log(`Query 1: ${query1}`);
    console.log(`Query 2: ${query2}`);

    // Execute LWT queries separately
    await client.execute(query1, [id], { prepare: true });
    await client.execute(query2, [existing.category, existing.subcategory, id], { prepare: true });
    return true;
  }

  // HARD DELETE — Batch DELETE from both tables
  static async hardDelete(id) {
    const existing = await this.getById(id);
    if (!existing) return null;

    const query1 = `DELETE FROM products_by_id WHERE product_id = ?`;
    const query2 = `DELETE FROM products WHERE category = ? AND subcategory = ? AND product_id = ?`;
    
    console.log(`\n[CQL EXECUTE] HARD DELETE PRODUCT`);
    console.log(`Query 1: ${query1}`);
    console.log(`Query 2: ${query2}`);

    const queries = [
      { query: query1, params: [id] },
      { query: query2, params: [existing.category, existing.subcategory, id] }
    ];
    await client.batch(queries, { prepare: true });
    return true;
  }

  // STATS — Count cards per category (aggregated in JS)
  static async getStats() {
    const query = 'SELECT category FROM products_by_id';
    console.log(`\n[CQL EXECUTE] GET STATS (Aggregated in JS)`);
    console.log(`Query: ${query}`);
    
    const result = await client.execute(query, [], { prepare: true });
    const counts = {};
    for (const row of result.rows) {
      counts[row.category] = (counts[row.category] || 0) + 1;
    }
    return counts;
  }
}

module.exports = Product;
