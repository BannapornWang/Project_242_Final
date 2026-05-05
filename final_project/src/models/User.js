const client = require('../config/cassandra');
const cassandra = require('cassandra-driver');
const bcrypt = require('bcryptjs');

const SALT_ROUNDS = 10;

class User {
  // REGISTER — Create new user
  static async create(username, email, password) {
    // Check if username already exists
    const existing = await this.getByUsername(username);
    if (existing) throw new Error('USERNAME_EXISTS');

    const id = cassandra.types.Uuid.random();
    const hashedPassword = await bcrypt.hash(password, SALT_ROUNDS);

    const query = `
      INSERT INTO users (user_id, username, email, password_hash, display_name, created_at)
      VALUES (?, ?, ?, ?, ?, toTimestamp(now()))
    `;
    const params = [id, username.toLowerCase(), email.toLowerCase(), hashedPassword, username];

    console.log(`\n[CQL EXECUTE] CREATE USER`);
    console.log(`Query: INSERT INTO users (...) VALUES (...)`);

    await client.execute(query, params, { prepare: true });
    return { user_id: id.toString(), username: username.toLowerCase(), display_name: username };
  }

  // LOGIN — Verify credentials
  static async authenticate(username, password) {
    const user = await this.getByUsername(username.toLowerCase());
    if (!user) return null;

    const isValid = await bcrypt.compare(password, user.password_hash);
    if (!isValid) return null;

    console.log(`\n[CQL EXECUTE] AUTHENTICATE USER`);
    console.log(`User: ${user.username} — Login successful`);

    return {
      user_id: user.user_id.toString(),
      username: user.username,
      display_name: user.display_name || user.username,
      email: user.email
    };
  }

  // GET BY USERNAME
  static async getByUsername(username) {
    const query = 'SELECT * FROM users WHERE username = ?';
    console.log(`\n[CQL EXECUTE] GET USER BY USERNAME`);
    console.log(`Query: ${query}`);
    const result = await client.execute(query, [username.toLowerCase()], { prepare: true });
    return result.rows[0] || null;
  }
}

module.exports = User;
