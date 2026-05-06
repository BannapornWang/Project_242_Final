const express = require('express');
const multer = require('multer');
const path = require('path');
const fs = require('fs');
const { requireAuth } = require('../middleware/auth');
const router = express.Router();

const storage = multer.diskStorage({
    destination: (req, file, cb) => {
        // Use category to determine the subfolder, default to 'general'
        const category = req.body.category || 'general';
        const dir = path.join(__dirname, '../../public/images', category);
        
        // Create directory if it doesn't exist
        console.log(`Attempting to save file to: ${dir}`);
        if (!fs.existsSync(dir)){
            console.log(`Directory ${dir} does not exist, creating it.`);
            try {
                fs.mkdirSync(dir, { recursive: true });
                console.log(`Directory ${dir} created successfully.`);
            } catch (error) {
                console.error(`Error creating directory ${dir}:`, error);
                return cb(error);
            }
        }
        cb(null, dir);
    },
    filename: (req, file, cb) => {
        // Create a unique filename: timestamp + random number + original extension
        const uniqueSuffix = Date.now() + '-' + Math.round(Math.random() * 1E9);
        cb(null, uniqueSuffix + path.extname(file.originalname));
    }
});

// Configure multer
const upload = multer({ 
    storage: storage,
    limits: { fileSize: 5 * 1024 * 1024 }, // 5MB max
    fileFilter: (req, file, cb) => {
        if (file.mimetype.startsWith('image/')) {
            cb(null, true);
        } else {
            cb(new Error('รองรับเฉพาะไฟล์รูปภาพเท่านั้น'));
        }
    }
});

// POST /api/upload
router.post('/', requireAuth, upload.single('image'), (req, res) => {
    if (!req.file) {
        return res.status(400).json({ error: 'ไม่พบไฟล์รูปภาพ' });
    }
    const category = req.body.category || 'general';
    // Return the relative URL to the image
    const imageUrl = `/images/${category}/${req.file.filename}`;
    res.json({ imageUrl });
});

module.exports = router;
