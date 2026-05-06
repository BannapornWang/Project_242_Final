USE trading_card_shop;

-- =============================================================================
-- 5. User accounts
-- =============================================================================
-- Insert default admin user
-- Password is 'admin123' hashed with bcrypt
INSERT INTO users (user_id, username, email, password_hash, display_name, created_at)
VALUES (
    55555555-5555-5555-5555-555555555555,
    'admin',
    'admin@doocard.wiki',
    '$2b$10$3/xyU.HbgewgdsIy9KSPRe8PLXUlae27HuR6L7NVS2EgZQZCKpMF2', 
    'Admin',
    toTimestamp(now())
);

-- Insert mock user 1
-- Password is 'user123' hashed with bcrypt
INSERT INTO users (user_id, username, email, password_hash, display_name, created_at)
VALUES (
    66666666-6666-6666-6666-666666666666,
    'mockuser1',
    'user1@doocard.wiki',
    '$2b$10$x15nrVoel9VO3lwBPfyxlOeM/N.4mlaCPoqZFJw/uUc6yEtBOF6g2', 
    'Mock User 1',
    toTimestamp(now())
);

-- Insert mock user 2
-- Password is 'user123' hashed with bcrypt
INSERT INTO users (user_id, username, email, password_hash, display_name, created_at)
VALUES (
    77777777-7777-7777-7777-777777777777,
    'mockuser2',
    'user2@doocard.wiki',
    '$2b$10$x15nrVoel9VO3lwBPfyxlOeM/N.4mlaCPoqZFJw/uUc6yEtBOF6g2', 
    'Mock User 2',
    toTimestamp(now())
);