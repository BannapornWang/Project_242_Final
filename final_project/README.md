# DooCard Wiki — ฐานข้อมูลการ์ดเกม

## เกี่ยวกับโปรเจกต์
**DooCard Wiki** เป็นเว็บไซต์ฐานข้อมูลการ์ดเกมสะสมที่ทุกคนสามารถเพิ่ม แก้ไข และลบข้อมูลการ์ดได้เอง เหมือน Wikipedia แต่สำหรับการ์ดเกม

### ซีรีส์ที่รองรับ
- 🎴 **Yu-Gi-Oh!** — การ์ด Monster, Spell, Trap และอื่นๆ
- ⚔️ **Cardfight!! Vanguard** — การ์ด Grade Units, Triggers และ Boosters
- 🦄 **My Little Pony CCG** — Starter Decks
- 🤖 **Gundam Card Game** — Starter Decks

---

## เทคโนโลยีที่ใช้
- **Backend**: Node.js + Express.js
- **Database**: Apache Cassandra (NoSQL)
- **Frontend**: HTML/CSS/JavaScript
- **Container**: Docker + Docker Compose

---

## วิธีการติดตั้งและรัน

### ข้อกำหนดเบื้องต้น
- ติดตั้ง Docker และ Docker Compose
- ติดตั้ง Node.js เวอร์ชัน 18 ขึ้นไป

### ขั้นตอนการติดตั้ง

1. **เริ่ม Docker**
   ```bash
   docker-compose up -d
   ```
   รอประมาณ 60 วินาทีให้ Cassandra เริ่มทำงาน

2. **ตั้งค่าฐานข้อมูล**
   ```bash
   docker exec cassandra-node bash /cassandra-init.sh
   ```

3. **ติดตั้งแพ็กเกจและเตรียมข้อมูล**
   ```bash
   npm install
   npm run seed
   ```

4. **รันแอปพลิเคชัน**
   ```bash
   npm run dev
   ```

5. **เปิดเว็บไซต์**
   ไปที่ `http://localhost:3000` ในเบราว์เซอร์

---

## วิธีการใช้งาน

### หน้าเว็บหลัก
- **หน้าหลัก (index.html)**: ดูสถิติ ค้นหา และเลือกดูตามหมวดหมู่
- **ฐานข้อมูล (database.html)**: จัดการการ์ด (เพิ่ม แก้ไข ลบ) พร้อมฟิลเตอร์และค้นหา
- **เข้าสู่ระบบ (login.html)**: เข้าสู่ระบบด้วยชื่อผู้ใช้และรหัสผ่าน
- **สมัครสมาชิก (register.html)**: สมัครสมาชิกใหม่

### API สำคัญ (สำหรับนักพัฒนา)
- `GET /api/products?category=yugioh` — ดูการ์ดตามซีรีส์
- `POST /api/products` — เพิ่มการ์ดใหม่ (ต้องเข้าสู่ระบบ)
- `PUT /api/products/:id` — แก้ไขการ์ด (ต้องเข้าสู่ระบบ)
- `DELETE /api/products/:id/permanent` — ลบการ์ด (ต้องเข้าสู่ระบบ)

---

## สถาปัตยกรรม
เว็บไซต์นี้ใช้ Node.js เป็นเซิร์ฟเวอร์ เชื่อมต่อกับ Cassandra ฐานข้อมูล NoSQL ผ่าน Docker

```
เบราว์เซอร์ → Node.js (Port 3000) → Cassandra (Port 9042)
```

---

## ผู้พัฒนา
โปรเจกต์นี้สร้างขึ้นเพื่อแสดงการใช้งาน NoSQL กับฐานข้อมูลการ์ดเกม หากมีคำถาม สามารถดูโค้ดในโฟลเดอร์นี้ได้
