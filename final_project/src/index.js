require('dotenv').config();
const express = require('express');
const session = require('express-session');
const path = require('path');
const client = require('./config/cassandra');
const errorHandler = require('./middleware/errorHandler');

const productsRouter = require('./routes/products');
const authRouter = require('./routes/auth');
const uploadRouter = require('./routes/upload');

const app = express();
app.use(express.json());

// Session middleware (in-memory store for demo)
app.use(session({
  secret: process.env.SESSION_SECRET || 'doocard-wiki-secret-2026',
  resave: false,
  saveUninitialized: false,
  cookie: {
    maxAge: 24 * 60 * 60 * 1000, // 24 hours
    httpOnly: true,
    sameSite: 'lax'
  }
}));

// Serve static frontend files from 'public' directory
app.use(express.static(path.join(__dirname, '../public')));

// API Routes
app.use('/api/auth', authRouter);
app.use('/api/products', productsRouter);
app.use('/api/upload', uploadRouter);

// Basic health check — shows Cassandra connection status
app.get('/health', async (req, res) => {
  try {
    await client.execute('SELECT now() FROM system.local');
    res.status(200).json({ status: 'ok', cassandra: 'connected', engine: 'Apache Cassandra 4.x' });
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

    // Auto-create users table if not exists
    try {
      await client.execute(`
        CREATE TABLE IF NOT EXISTS users (
          user_id    UUID,
          username   TEXT,
          email      TEXT,
          password_hash TEXT,
          display_name  TEXT,
          created_at TIMESTAMP,
          PRIMARY KEY (username)
        )
      `);
      console.log('✓ Users table ready');
    } catch (e) {
      console.log('⚠ Users table may already exist:', e.message);
    }

    app.listen(PORT, () => {
      console.log(`✓ DooCard Wiki API running on http://0.0.0.0:${PORT}`);
    });
  } catch (err) {
    console.error('✗ Failed to connect to Cassandra:', err.message);
    process.exit(1);
  }
}

start();
