# DooCard Wiki — Card Database with Apache Cassandra (NoSQL)

## 1. Project Description
แอปพลิเคชัน **DooCard Wiki** เป็นฐานข้อมูลการ์ดเกมสะสม (Trading Card Game Database) ที่สร้างด้วย **Node.js + Express** และใช้ **Apache Cassandra** เป็น NoSQL Database

แนวคิดหลักคือการสร้าง "Wikipedia ของการ์ดเกม" ที่ **ทุกคนสามารถเพิ่ม แก้ไข และลบข้อมูลการ์ดได้อิสระ** เพื่อสร้างฐานข้อมูลชุมชน

### ซีรีส์ที่รองรับ:
- 🎴 **Yu-Gi-Oh!** — Monster, Spell, Trap, Booster, Structure Deck
- ⚔️ **Cardfight!! Vanguard** — Grade Units, Triggers, Boosters
- 🦄 **My Little Pony CCG** — Starter Decks
- 🤖 **Gundam Card Game** — Starter Decks

---

## 2. NoSQL Use-Case Showcase

| Use-Case | CQL Operation | Description |
|----------|---------------|-------------|
| **Create** | `BATCH INSERT` | เพิ่มการ์ดใหม่ด้วย Batch INSERT ไปยัง 2 ตาราง (Denormalized Design) |
| **Read** | `SELECT ... WHERE partition_key = ?` | ค้นหา O(1) ด้วย Partition Key หรือ In-Memory Filter ด้วยชื่อ |
| **Update** | `UPDATE ... IF EXISTS` (LWT) | แก้ไขข้อมูลพร้อม Lightweight Transactions เพื่อความปลอดภัย |
| **Delete** | `BATCH DELETE` | ลบถาวรจาก 2 ตารางพร้อมกันด้วย Batch Operation |

### Cassandra Design Patterns Used:
- **Denormalized Tables** — `products` (query by category) + `products_by_id` (query by UUID)
- **Lightweight Transactions (LWT)** — `IF EXISTS` สำหรับ Update operations
- **Batch Operations** — Atomic writes across multiple tables
- **Partition Key Design** — `(category, subcategory)` for O(1) category lookups

---

## 3. Architecture Diagram

```
┌───────────────────────┐          ┌───────────────────────┐
│                       │          │                       │
│   Browser (Frontend)  ├──────────▶   Node.js + Express   │
│   HTML/CSS/JS         │   HTTP   │   REST API (Port 3000)│
│                       │          │                       │
└───────────────────────┘          └───────────┬───────────┘
                                               │
                                               │ CQL (Port 9042)
                                               ▼
                           ┌───────────────────────────────┐
                           │     Apache Cassandra 4.x      │
                           │       (Dockerized)            │
                           │                               │
                           │  KEYSPACE: trading_card_shop  │
                           │  ┌─────────────────────────┐  │
                           │  │ products (by category)  │  │
                           │  │ products_by_id (by UUID)│  │
                           │  └─────────────────────────┘  │
                           └───────────────────────────────┘
```

---

## 4. How to Run

### Prerequisites
- Docker & Docker Compose installed
- Node.js 18+ installed

### Step 1: Start Docker
```bash
docker-compose up -d
```
Wait ~60 seconds for Cassandra to initialize.

### Step 2: Initialize Database
```bash
docker exec cassandra-node bash /cassandra-init.sh
```

### Step 3: Install Dependencies & Seed
```bash
npm install
npm run seed
```

### Step 4: Start the App
```bash
npm run dev
```
Open `http://localhost:3000` in your browser.

---

## 5. CRUD Operations (API)

| Method | Path | Description |
|--------|------|-------------|
| `GET` | `/health` | ตรวจสอบสถานะ API + Cassandra |
| `GET` | `/api/products?category=yugioh` | ดึงการ์ดตามซีรีส์ |
| `GET` | `/api/products/:id` | ดึงข้อมูลการ์ดเดี่ยว |
| `GET` | `/api/products/search?name=dragon` | ค้นหาการ์ดจากชื่อ |
| `GET` | `/api/products/stats` | สถิติจำนวนการ์ดแต่ละซีรีส์ |
| `POST` | `/api/products` | **Create** — เพิ่มการ์ดใหม่ (🔒 ต้องเข้าสู่ระบบ) |
| `PUT` | `/api/products/:id` | **Update** — แก้ไขข้อมูลการ์ด (LWT) (🔒 ต้องเข้าสู่ระบบ) |
| `DELETE` | `/api/products/:id/permanent` | **Delete** — ลบการ์ดถาวร (🔒 ต้องเข้าสู่ระบบ) |

### Authentication API (Session-based)

| Method | Path | Description |
|--------|------|-------------|
| `POST` | `/api/auth/register` | สมัครสมาชิกและเข้าสู่ระบบอัตโนมัติ |
| `POST` | `/api/auth/login` | เข้าสู่ระบบด้วย Username/Password |
| `POST` | `/api/auth/logout` | ออกจากระบบ |
| `GET` | `/api/auth/me` | ตรวจสอบสถานะ Session ปัจจุบัน |

---

## 6. Frontend Pages

| Page | Description |
|------|-------------|
| `index.html` | หน้าหลัก — Dashboard, Stats, Search, Browse by Category |
| `database.html` | ฐานข้อมูลการ์ด — CRUD UI ครบ, Filter, Search, CQL Log |
| `login.html` | หน้าเข้าสู่ระบบ — ใช้งาน Session-based Auth |
| `register.html` | หน้าสมัครสมาชิก — Hash Password ด้วย bcryptjs |

---

## 7. Tech Stack

- **Backend**: Node.js 18 + Express.js
- **Database**: Apache Cassandra 4.1 (NoSQL)
- **Driver**: DataStax cassandra-driver
- **Frontend**: Vanilla HTML/CSS/JS
- **Container**: Docker + Docker Compose
