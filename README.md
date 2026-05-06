# 🃏 DooCard Wiki

> ฐานข้อมูลการ์ดเกมสะสมแบบ Wiki — เพิ่ม แก้ไข ลบข้อมูลการ์ดได้เอง

| Tech | Stack |
|------|-------|
| **Backend** | Node.js 18 + Express |
| **Database** | Apache Cassandra 4.1 |
| **Auth** | bcrypt + express-session |
| **Infra** | Docker & Docker Compose |
| **Frontend** | Vanilla HTML/CSS/JS |

**หมวดหมู่การ์ดที่รองรับ:** Yu-Gi-Oh! · Vanguard · My Little Pony · Gundam

---

## 📁 โครงสร้างโปรเจกต์

```
Project_242_Final/
└── final_project/          ← โฟลเดอร์หลักของแอป
    ├── docker-compose.yml  ← ตั้งค่า Container ทั้งหมด
    ├── Dockerfile
    ├── cassandra/           ← ไฟล์ Schema & Seed (.cql)
    ├── src/
    │   ├── index.js         ← Entry point
    │   ├── config/          ← ตั้งค่า Cassandra connection
    │   ├── models/          ← Data models
    │   ├── routes/          ← API routes (auth, products, orders, upload)
    │   ├── middleware/      ← Auth middleware
    │   └── seed/            ← Seed script
    └── public/              ← หน้าเว็บ (HTML/CSS/Images)
```

---

## 🏗️ สถาปัตยกรรมระบบ

```
Browser ──► Node.js (Port 3000) ──► Cassandra (Port 9042)
               │                         │
            tcg-app                 cassandra-node
               └─────── tcg-network ─────┘
                     (Docker Bridge)
```

---

## 🚀 เริ่มต้นใช้งาน

### สิ่งที่ต้องมี

- [Docker Desktop](https://www.docker.com/products/docker-desktop/) (รวม Docker Compose แล้ว)
- [Git](https://git-scm.com/)

### ขั้นตอนที่ 1 — Clone โปรเจกต์

```bash
git clone https://github.com/BannapornWang/Project_242_Final.git
cd Project_242_Final/final_project
```

### ขั้นตอนที่ 2 — สร้างและรัน Container

```bash
docker-compose up -d --build
```

> [!NOTE]
> Cassandra ใช้เวลาบูตประมาณ **60 วินาที** — Docker จะรอให้พร้อมก่อนเริ่ม Node.js อัตโนมัติ (ผ่าน healthcheck)

ตรวจสอบว่า Container ทำงานปกติ:

```bash
docker ps
```

### ขั้นตอนที่ 3 — สร้างฐานข้อมูล & โหลดข้อมูลเริ่มต้น

```bash
# สร้าง Keyspace, Tables และโหลด Seed Data
docker exec -it cassandra-node bash /cassandra-init.sh
```

### ขั้นตอนที่ 4 — นำเข้าข้อมูลเพิ่มเติม (ถ้าต้องการ)

```bash
docker exec -it tcg-app npm run seed
```

### ขั้นตอนที่ 5 — เปิดใช้งาน 🎉

เข้าเบราว์เซอร์ที่ → **http://localhost:3000**

---

## 🤝 การทำงานร่วมกันในทีม

เมื่อเพิ่ม/แก้ไขการ์ดผ่านหน้าเว็บ ระบบจะบันทึกคำสั่ง CQL ลงในโฟลเดอร์ `cassandra/` อัตโนมัติ

### คนที่เพิ่มข้อมูล (Sender)

1. เพิ่ม/แก้ไขการ์ดผ่านหน้าเว็บตามปกติ
2. ตรวจสอบไฟล์ `cassandra/*.cql` ว่ามีการเปลี่ยนแปลง
3. Commit & Push ขึ้น GitHub

### คนที่รับข้อมูล (Receiver)

1. `git pull` เพื่อรับไฟล์ล่าสุด
2. รันคำสั่งอัปเดตฐานข้อมูล:
   ```bash
   docker exec -it cassandra-node bash /cassandra-init.sh
   ```

---

## 🛠️ คำสั่งจัดการระบบ

| คำสั่ง | ผลลัพธ์ |
|--------|---------|
| `docker-compose stop` | หยุดระบบชั่วคราว (เก็บ Container ไว้) |
| `docker-compose start` | เริ่มระบบใหม่จากที่หยุดไว้ |
| `docker-compose down` | ลบ Container แต่**เก็บข้อมูล**ไว้ |
| `docker-compose down -v` | ลบทุกอย่าง รวมถึง**ข้อมูลในฐานข้อมูล** |
| `docker-compose up -d --build` | Build ใหม่และรันทุก Container |

---

## 💻 สำหรับนักพัฒนา (ไม่ใช้ Docker)

หากต้องการรันบนเครื่องโดยตรง:

```bash
cd final_project
npm install
```

สร้างไฟล์ `.env` ในโฟลเดอร์ `final_project/`:

```env
NODE_ENV=development
PORT=3000
CASSANDRA_HOST=127.0.0.1
CASSANDRA_PORT=9042
CASSANDRA_KEYSPACE=trading_card_shop
CASSANDRA_DC=datacenter1
```

```bash
npm run dev    # รันด้วย nodemon (auto-reload)
```

> [!IMPORTANT]
> ต้องมี Cassandra รันอยู่ที่ `127.0.0.1:9042` ก่อนจึงจะเชื่อมต่อได้

---

## 📌 API Endpoints

| Method | Path | คำอธิบาย | Auth |
|--------|------|----------|------|
| `POST` | `/api/auth/register` | สมัครสมาชิก | ❌ |
| `POST` | `/api/auth/login` | เข้าสู่ระบบ | ❌ |
| `GET` | `/api/products` | ดูการ์ดทั้งหมด | ❌ |
| `POST` | `/api/products` | เพิ่มการ์ดใหม่ | ✅ |
| `PUT` | `/api/products/:id` | แก้ไขการ์ด | ✅ |
| `DELETE` | `/api/products/:id` | ลบการ์ด | ✅ |
| `POST` | `/api/upload` | อัปโหลดรูปการ์ด | ✅ |
