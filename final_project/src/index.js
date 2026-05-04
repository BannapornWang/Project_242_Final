require('dotenv').config();
const express = require('express');
const path = require('path');
const client = require('./config/cassandra');
const errorHandler = require('./middleware/errorHandler');

const productsRouter = require('./routes/products');
const ordersRouter = require('./routes/orders');

const app = express();
app.use(express.json());

// Serve static frontend files from 'public' directory
app.use(express.static(path.join(__dirname, '../public')));

// Routes
app.use('/api/products', productsRouter);
app.use('/api/orders', ordersRouter);

// Basic health check
app.get('/health', async (req, res) => {
  try {
    await client.execute('SELECT now() FROM system.local');
    res.status(200).json({ status: 'ok', cassandra: 'connected' });
  } catch (err) {
    res.status(503).json({ status: 'error', cassandra: err.message });
  }
});

// Error handling middleware
app.use(errorHandler);

const PORT = process.env.PORT || 3000;

async function start() {
  try {
    await client.connect();
    console.log('✓ Connected to Cassandra cluster');

    app.listen(PORT, () => {
      console.log(`✓ TCG Shop API running on http://0.0.0.0:${PORT}`);
    });
  } catch (err) {
    console.error('✗ Failed to connect to Cassandra:', err.message);
    process.exit(1);
  }
}

start();
