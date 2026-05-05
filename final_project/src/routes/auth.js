const express = require('express');
const User = require('../models/User');
const router = express.Router();

// POST /api/auth/register
router.post('/register', async (req, res, next) => {
  try {
    const { username, email, password } = req.body;
    if (!username || !email || !password) {
      return res.status(400).json({ error: 'กรุณากรอก username, email, password' });
    }
    if (username.length < 3) {
      return res.status(400).json({ error: 'Username ต้องมีอย่างน้อย 3 ตัวอักษร' });
    }
    if (password.length < 4) {
      return res.status(400).json({ error: 'Password ต้องมีอย่างน้อย 4 ตัวอักษร' });
    }

    const user = await User.create(username, email, password);
    // Auto-login after register
    req.session.user = user;
    res.status(201).json({ message: 'สมัครสมาชิกสำเร็จ', user });
  } catch (err) {
    if (err.message === 'USERNAME_EXISTS') {
      return res.status(409).json({ error: 'Username นี้ถูกใช้แล้ว' });
    }
    next(err);
  }
});

// POST /api/auth/login
router.post('/login', async (req, res, next) => {
  try {
    const { username, password } = req.body;
    if (!username || !password) {
      return res.status(400).json({ error: 'กรุณากรอก username และ password' });
    }

    const user = await User.authenticate(username, password);
    if (!user) {
      return res.status(401).json({ error: 'Username หรือ Password ไม่ถูกต้อง' });
    }

    req.session.user = user;
    res.json({ message: 'เข้าสู่ระบบสำเร็จ', user });
  } catch (err) { next(err); }
});

// POST /api/auth/logout
router.post('/logout', (req, res) => {
  req.session.destroy(() => {
    res.json({ message: 'ออกจากระบบสำเร็จ' });
  });
});

// GET /api/auth/me — Check current session
router.get('/me', (req, res) => {
  if (req.session && req.session.user) {
    res.json({ loggedIn: true, user: req.session.user });
  } else {
    res.json({ loggedIn: false });
  }
});

module.exports = router;
