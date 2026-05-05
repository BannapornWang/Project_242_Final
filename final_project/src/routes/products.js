const express = require('express');
const Product = require('../models/Product');
const { requireAuth } = require('../middleware/auth');
const router = express.Router();

// POST /api/products
router.post('/', requireAuth, async (req, res, next) => {
  try {
    const { category, name, price, stock_quantity } = req.body;
    if (!category || !name || price === undefined || stock_quantity === undefined) {
      return res.status(400).json({ error: 'Missing required fields: category, name, price, stock_quantity' });
    }
    const id = await Product.create(req.body);
    res.status(201).json({ message: 'Product created', product_id: id });
  } catch (err) { next(err); }
});

// GET /api/products/search?name=dark+magician
router.get('/search', async (req, res, next) => {
  try {
    const { name } = req.query;
    const results = await Product.searchByName(name || '');
    res.json(results);
  } catch (err) { next(err); }
});

// GET /api/products/low-stock
router.get('/low-stock', async (req, res, next) => {
  try {
    const results = await Product.getLowStock();
    res.json(results);
  } catch (err) { next(err); }
});

// GET /api/products/stats
router.get('/stats', async (req, res, next) => {
  try {
    const stats = await Product.getStats();
    res.json({ category_counts: stats });
  } catch (err) { next(err); }
});

// GET /api/products/:id
router.get('/:id', async (req, res, next) => {
  try {
    // Basic validation to avoid Cassandra TypeError if ID is not a valid UUID string
    const uuidRegex = /^[0-9a-f]{8}-[0-9a-f]{4}-[1-5][0-9a-f]{3}-[89ab][0-9a-f]{3}-[0-9a-f]{12}$/i;
    if (!uuidRegex.test(req.params.id)) {
      return res.status(400).json({ error: 'Invalid UUID format' });
    }

    const product = await Product.getById(req.params.id);
    if (!product) return res.status(404).json({ error: 'Not found' });
    res.json(product);
  } catch (err) { next(err); }
});

// GET /api/products?category=yugioh&subcategory=monster
router.get('/', async (req, res, next) => {
  try {
    const { category, subcategory } = req.query;
    if (!category) return res.status(400).json({ error: 'Category is required for listing products' });
    const results = await Product.getByCategory(category, subcategory);
    res.json(results);
  } catch (err) { next(err); }
});

// PUT /api/products/:id
router.put('/:id', requireAuth, async (req, res, next) => {
  try {
    const { price, stock_quantity, description, image_url, is_available } = req.body;
    const updated = await Product.update(req.params.id, { price, stock_quantity, description, image_url, is_available });
    if (!updated) return res.status(404).json({ error: 'Not found' });
    res.json({ message: 'Product updated', product: updated });
  } catch (err) { next(err); }
});

// DELETE /api/products/:id/permanent
router.delete('/:id/permanent', requireAuth, async (req, res, next) => {
  try {
    const deleted = await Product.hardDelete(req.params.id);
    if (!deleted) return res.status(404).json({ error: 'Not found' });
    res.json({ message: 'Product permanently deleted' });
  } catch (err) { next(err); }
});

// DELETE /api/products/:id
router.delete('/:id', requireAuth, async (req, res, next) => {
  try {
    const deleted = await Product.softDelete(req.params.id);
    if (!deleted) return res.status(404).json({ error: 'Not found' });
    res.json({ message: 'Product softly deleted' });
  } catch (err) { next(err); }
});

module.exports = router;
