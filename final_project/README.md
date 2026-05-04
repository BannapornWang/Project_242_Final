# Trading Card Game Shop — Cassandra + Node.js Backend

## 1. Project Description
This project is a RESTful API backend for a Trading Card Game E-commerce platform. It leverages **Node.js** with Express for high-performance routing and **Apache Cassandra** as a highly available, distributed NoSQL database. 

The application catalog currently supports four game categories:
- **Yugioh**
- **Vanguard (Cardfight!!)**
- **My Little Pony (MLP)**
- **Gundam**

Key Features:
- Denormalized table design (`products` and `products_by_id`) for optimal O(1) reads.
- Lightweight Transactions (LWT) for safe inventory and price updates.
- Transactional batch operations for order placement and stock deduction.
- Containerized development environment using Docker Compose.

---

## 2. Architecture Diagram

```ascii
+-----------------------+           +-----------------------+
|                       |           |                       |
|   Client / Frontend   +----------->    Node.js + Express  |
|   (cURL, Postman)     |   HTTP    |    (REST API Server)  |
|                       |           |    Port 3000          |
+-----------------------+           +-----------+-----------+
                                                |
                                                | CQL (Port 9042)
                                                | Datastax Driver
                                                v
                            +---------------------------------------+
                            |                                       |
                            |           Apache Cassandra            |
                            |             (Dockerized)              |
                            |                                       |
                            |  +---------------------------------+  |
                            |  | KEYSPACE: trading_card_shop     |  |
                            |  |                                 |  |
                            |  | - products (Partition: category)|  |
                            |  | - products_by_id (UUID lookup)  |  |
                            |  | - orders                        |  |
                            |  | - order_items                   |  |
                            |  +---------------------------------+  |
                            |                                       |
                            +---------------------------------------+
```

---

## 3. How to Run (Step-by-Step)

### Prerequisites
- Docker & Docker Compose installed
- Node.js 18+ installed natively (if running scripts locally)

### Step 1: Start the Docker Infrastructure
Open a terminal in the project root and run:
```bash
docker-compose up -d
```
Wait about 60 seconds for Cassandra to fully initialize.

### Step 2: Initialize the Database Keyspace
Run the initialization script inside the Cassandra container:
```bash
docker exec cassandra-node bash /cassandra-init.sh
```

### Step 3: Install Node.js Dependencies & Seed Data
```bash
npm install
npm run seed
```

### Step 4: Start the API Server
```bash
npm run dev
```
The server will start on `http://localhost:3000`.

---

## 4. API Endpoints

| Method | Path | Description | Example Target |
|--------|------|-------------|----------------|
| **GET** | `/health` | Check API and DB status | `http://localhost:3000/health` |
| **GET** | `/api/products?category=yugioh` | Fetch products in a game category | `http://localhost:3000/api/products?category=vanguard` |
| **GET** | `/api/products/:id` | Fetch specific card by UUID | `http://localhost:3000/api/products/a3f1...` |
| **GET** | `/api/products/low-stock` | Find inventory below 5 units | `http://localhost:3000/api/products/low-stock` |
| **POST** | `/api/products` | Create a new card | `{"category":"yugioh","name":"Card"}` |
| **PUT** | `/api/products/:id` | Update price/stock | `{"price":1500, "stock_quantity":2}` |
| **DELETE**| `/api/products/:id` | Soft delete card | `http://localhost:3000/api/products/a3f1...` |
| **POST** | `/api/orders` | Place an order & deduct stock | `{"customer_id":"...","items":[...]}` |

---

## 5. Screenshots Required for Submission

Please capture the following screenshots and place them in your assignment folder:

- [ ] `screenshot-docker-ps.png`: Proof that both `cassandra-node` and `tcg-app` are **Up (healthy)**.
- [ ] `screenshot-cqlsh-describe.png`: Proof of keyspace and `products` table schema from `cqlsh`.
- [ ] `screenshot-terminal-cql.png`: Node.js terminal showing `[CQL EXECUTE]` logs when creating a card.
- [ ] `screenshot-api-postman.png`: Postman or browser showing a successful `GET /api/products?category=yugioh`.
- [ ] `screenshot-cqlsh-tracing.png`: `TRACING ON;` execution in cqlsh for Gundam cards.

---

## 6. CRUD Evidence Summary

Run the automated scripts to generate your text/json evidence:
1. `sh test-docker.sh`
2. `sh test-crud.sh`

**Review the `evidence/` folder to confirm:**
- Card creation returns a UUID (`crud-create-1.json`).
- Fetching by category correctly lists items (`crud-read-all.json`).
- Updates correctly modify the price (`crud-verify-update.json`).
- Deletes correctly set `is_available: false` (`crud-verify-delete.json`).
