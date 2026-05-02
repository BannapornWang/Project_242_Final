#!/bin/bash
# =============================================================================
# test-crud.sh — API CRUD Evidence Collection Script
# Run this script to hit the Express API endpoints and save the JSON responses.
# =============================================================================

echo "=== STARTING API CRUD EVIDENCE COLLECTION ==="
mkdir -p evidence

API_URL="http://localhost:3000/api/products"

echo "1. CREATE: Inserting 3 new cards..."

# 1. Yugioh Card
curl -s -X POST $API_URL \
  -H "Content-Type: application/json" \
  -d '{"category":"yugioh","subcategory":"monster_card","name":"Exodia the Forbidden One","price":5000,"stock_quantity":1}' > evidence/crud-create-1.json

# 2. Vanguard Card
curl -s -X POST $API_URL \
  -H "Content-Type: application/json" \
  -d '{"category":"vanguard","subcategory":"grade_3_unit","name":"Majesty Lord Blaster","price":1200,"stock_quantity":3}' > evidence/crud-create-2.json

# 3. Gundam Card
curl -s -X POST $API_URL \
  -H "Content-Type: application/json" \
  -d '{"category":"gundam","subcategory":"mobile_suit","name":"Wing Gundam Zero","price":2000,"stock_quantity":5}' > evidence/crud-create-3.json

echo "   -> Saved CREATE responses to evidence/crud-create-*.json"

# Extract the product_id of the Yugioh card to use in subsequent requests
# Node.js is used here for clean JSON parsing since jq might not be installed
PRODUCT_ID=$(node -e "const fs = require('fs'); const data = JSON.parse(fs.readFileSync('evidence/crud-create-1.json')); console.log(data.product_id);")
echo "   -> Extracted Target Product ID: $PRODUCT_ID"

echo "2. READ ALL: Fetching all Yugioh cards..."
curl -s -X GET "$API_URL?category=yugioh" > evidence/crud-read-all.json
echo "   -> Saved to evidence/crud-read-all.json"

echo "3. READ ONE: Fetching the newly created Yugioh card..."
curl -s -X GET "$API_URL/$PRODUCT_ID" > evidence/crud-read-one.json
echo "   -> Saved to evidence/crud-read-one.json"

echo "4. UPDATE: Modifying price and stock..."
curl -s -X PUT "$API_URL/$PRODUCT_ID" \
  -H "Content-Type: application/json" \
  -d '{"price": 5500, "stock_quantity": 0, "is_available": true}' > evidence/crud-update.json
echo "   -> Saved to evidence/crud-update.json"

echo "5. VERIFY UPDATE: Fetching card again to confirm changes..."
curl -s -X GET "$API_URL/$PRODUCT_ID" > evidence/crud-verify-update.json
echo "   -> Saved to evidence/crud-verify-update.json"

echo "6. DELETE: Soft deleting the card..."
curl -s -X DELETE "$API_URL/$PRODUCT_ID" > evidence/crud-delete.json
echo "   -> Saved to evidence/crud-delete.json"

echo "7. VERIFY DELETE: Fetching deleted card (should show is_available = false or 404)..."
curl -s -X GET "$API_URL/$PRODUCT_ID" > evidence/crud-verify-delete.json
echo "   -> Saved to evidence/crud-verify-delete.json"

echo ""
echo "=== CRUD EVIDENCE COLLECTION COMPLETE ==="
echo "Check the /evidence directory for your JSON responses."
