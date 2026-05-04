const express = require('express');
const router = express.Router();
const cassandra = require('cassandra-driver');
const client = require('../config/cassandra');
const Product = require('../models/Product');

// POST /api/orders
router.post('/', async (req, res, next) => {
  try {
    const { customer_id, items, shipping_name, shipping_address, payment_method } = req.body;
    if (!customer_id || !items || !items.length) {
      return res.status(400).json({ error: 'Missing customer_id or items' });
    }

    const order_id = cassandra.types.Uuid.random();
    let total_amount = 0;
    const queries = [];

    for (const item of items) {
      const product = await Product.getById(item.product_id);
      if (!product) return res.status(404).json({ error: `Product ${item.product_id} not found` });
      if (product.stock_quantity < item.quantity) {
        return res.status(400).json({ error: `Not enough stock for ${product.name}` });
      }

      const line_total = parseFloat((product.price * item.quantity).toFixed(2));
      total_amount += line_total;

      queries.push({
        query: `
          INSERT INTO order_items (order_id, product_id, product_name, category, subcategory, quantity, unit_price, line_total)
          VALUES (?, ?, ?, ?, ?, ?, ?, ?)
        `,
        params: [order_id, product.product_id, product.name, product.category, product.subcategory, item.quantity, product.price, line_total]
      });

      // Regular updates in batch
      queries.push({
        query: `UPDATE products_by_id SET stock_quantity = ? WHERE product_id = ?`,
        params: [product.stock_quantity - item.quantity, product.product_id]
      });
      queries.push({
        query: `UPDATE products SET stock_quantity = ? WHERE category = ? AND subcategory = ? AND product_id = ?`,
        params: [product.stock_quantity - item.quantity, product.category, product.subcategory, product.product_id]
      });
    }

    queries.push({
      query: `
        INSERT INTO orders (customer_id, order_id, created_at, status, total_amount, shipping_name, shipping_address, payment_method, updated_at)
        VALUES (?, ?, toTimestamp(now()), ?, ?, ?, ?, ?, toTimestamp(now()))
      `,
      params: [customer_id, order_id, 'pending', total_amount, shipping_name || '', shipping_address || '', payment_method || 'credit_card']
    });

    console.log(`\n[CQL EXECUTE] CREATE ORDER (Batch)`);
    console.log(`Total batch statements: ${queries.length}`);

    await client.batch(queries, { prepare: true });
    
    res.status(201).json({ message: 'Order created successfully', order_id: order_id.toString(), total_amount });
  } catch (err) { next(err); }
});

module.exports = router;
