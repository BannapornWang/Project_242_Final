const client = require('../config/cassandra');
const cassandra = require('cassandra-driver');

class Product {
  // CHECK DUPLICATE — ตรวจสอบว่ามีการ์ดชื่อเดียวกันใน category เดียวกันหรือไม่
  static async checkDuplicate(name, category) {
    const query = 'SELECT product_id, name, category FROM products_by_id LIMIT 1000';
    const result = await client.execute(query, [], { prepare: true });
    const lowerName = name.toLowerCase().trim();
    return result.rows.find(row =>
      row.name && row.name.toLowerCase().trim() === lowerName &&
      row.category === category
    ) || null;
  }

  // CREATE — Batch INSERT into both denormalized tables (with duplicate check)
  static async create(data, { skipDuplicateCheck = false } = {}) {
    // ตรวจสอบข้อมูลซ้ำก่อน insert
    if (!skipDuplicateCheck) {
      const existing = await this.checkDuplicate(data.name, data.category);
      if (existing) {
        console.log(`[DUPLICATE DETECTED] "${data.name}" already exists in category "${data.category}" with ID: ${existing.product_id}`);
        return { id: existing.product_id.toString(), duplicate: true };
      }
    }

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

    // Append to .cql seed file for reference
    await this.appendToSeedFile(data, id.toString());

    return { id: id.toString(), duplicate: false };
  }

  // Helper to write products to .cql files for user reference
  // Uses smart upsert: removes existing entry with same product_id before adding
  static async appendToSeedFile(data, id) {
    const fs = require('fs');
    const path = require('path');

    const seedFiles = {
      'yugioh': 'seed_yugioh.cql',
      'vanguard': 'seed_vanguard.cql',
      'mlp': 'seed_mlp.cql',
      'gundam': 'seed_gundam.cql'
    };

    const fileName = seedFiles[data.category];
    if (!fileName) return;

    // Path inside the container (mounted via docker-compose)
    const filePath = path.join(__dirname, '..', '..', 'cassandra', fileName);

    const escape = (val) => {
      if (typeof val === 'string') return `'${val.replace(/'/g, "''")}'`;
      if (val === undefined || val === null) return 'null';
      return val;
    };

    const sub = data.subcategory || 'general';
    const desc = data.description || '';
    const rarity = data.rarity || 'Common';
    const setName = data.set_name || '';
    const cardNum = data.card_number || '';
    const img = data.image_url || '';

    const newEntry = `
-- [ID: ${id}] Added/Updated via UI on ${new Date().toLocaleString()}
INSERT INTO products (category, subcategory, product_id, name, description, price, stock_quantity, rarity, set_name, card_number, image_url, is_available, created_at, updated_at)
VALUES (${escape(data.category)}, ${escape(sub)}, ${id}, ${escape(data.name)}, ${escape(desc)}, ${data.price}, ${data.stock_quantity}, ${escape(rarity)}, ${escape(setName)}, ${escape(cardNum)}, ${escape(img)}, true, toTimestamp(now()), toTimestamp(now()));

INSERT INTO products_by_id (product_id, category, subcategory, name, description, price, stock_quantity, rarity, set_name, card_number, image_url, is_available, created_at, updated_at)
VALUES (${id}, ${escape(data.category)}, ${escape(sub)}, ${escape(data.name)}, ${escape(desc)}, ${data.price}, ${data.stock_quantity}, ${escape(rarity)}, ${escape(setName)}, ${escape(cardNum)}, ${escape(img)}, true, toTimestamp(now()), toTimestamp(now()));
`;

    try {
      if (fs.existsSync(filePath)) {
        // อ่านไฟล์เดิม แล้วลบ entry ที่มี product_id เดียวกันออกก่อน
        let content = fs.readFileSync(filePath, 'utf8');

        // ลบ block เดิมที่มี UUID นี้ (comment + 2 INSERT statements)
        // Pattern: จับตั้งแต่ comment ที่มี ID จนถึงจบ INSERT ตัวที่สอง
        const idEscaped = id.replace(/[-]/g, '[-]');
        const pattern = new RegExp(
          `\n?-- \\[ID: ${idEscaped}\\][^\n]*\n` +
          `INSERT INTO products[^;]*;\s*\n?` +
          `\n?INSERT INTO products_by_id[^;]*;\s*\n?`,
          'g'
        );
        content = content.replace(pattern, '');

        // เขียนไฟล์ใหม่ (เนื้อหาเดิมที่ลบ entry ซ้ำแล้ว + entry ใหม่)
        fs.writeFileSync(filePath, content.trimEnd() + '\n' + newEntry);
        console.log(`[SEED UPDATE] Upserted product ${id} in ${fileName}`);
      }
    } catch (err) {
      console.error(`[SEED UPDATE ERROR] Could not write to ${fileName}:`, err.message);
    }
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

    const name = data.name !== undefined ? data.name : existing.name;
    const category = data.category !== undefined ? data.category : existing.category;
    const subcategory = data.subcategory !== undefined ? data.subcategory : existing.subcategory;
    const price = data.price !== undefined ? data.price : existing.price;
    const stock = data.stock_quantity !== undefined ? data.stock_quantity : existing.stock_quantity;
    const desc = data.description !== undefined ? data.description : existing.description;
    const imageUrl = data.image_url !== undefined ? data.image_url : existing.image_url;
    const avail = data.is_available !== undefined ? data.is_available : existing.is_available;
    const rarity = data.rarity !== undefined ? data.rarity : existing.rarity;
    const setName = data.set_name !== undefined ? data.set_name : existing.set_name;
    const cardNum = data.card_number !== undefined ? data.card_number : existing.card_number;

    const query1 = `
      UPDATE products_by_id 
      SET name = ?, category = ?, subcategory = ?, price = ?, stock_quantity = ?, description = ?, image_url = ?, is_available = ?, rarity = ?, set_name = ?, card_number = ?, updated_at = toTimestamp(now())
      WHERE product_id = ? IF EXISTS
    `;
    const params1 = [name, category, subcategory, price, stock, desc, imageUrl, avail, rarity, setName, cardNum, id];
    await client.execute(query1, params1, { prepare: true });

    const pkChanged = existing.category !== category || existing.subcategory !== subcategory;

    if (pkChanged) {
      // PK changed in products table: MUST DELETE OLD AND INSERT NEW
      const delQuery = `DELETE FROM products WHERE category = ? AND subcategory = ? AND product_id = ?`;
      await client.execute(delQuery, [existing.category, existing.subcategory, id], { prepare: true });

      const insQuery = `
        INSERT INTO products (category, subcategory, product_id, name, description, price, stock_quantity, rarity, set_name, card_number, image_url, is_available, created_at, updated_at)
        VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, toTimestamp(now()), toTimestamp(now()))
      `;
      const insParams = [category, subcategory, id, name, desc, price, stock, rarity, setName, cardNum, imageUrl, avail];
      await client.execute(insQuery, insParams, { prepare: true });
    } else {
      // PK did not change, normal update
      const query2 = `
        UPDATE products 
        SET name = ?, price = ?, stock_quantity = ?, description = ?, image_url = ?, is_available = ?, rarity = ?, set_name = ?, card_number = ?, updated_at = toTimestamp(now())
        WHERE category = ? AND subcategory = ? AND product_id = ? IF EXISTS
      `;
      const params2 = [name, price, stock, desc, imageUrl, avail, rarity, setName, cardNum, category, subcategory, id];
      await client.execute(query2, params2, { prepare: true });
    }

    const updatedProduct = await this.getById(id);

    // Update the .cql seed file with the new data (smart upsert — replaces old entry)
    await this.appendToSeedFile(updatedProduct, id.toString());

    return updatedProduct;
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
