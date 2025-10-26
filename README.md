# 📱 SME-SYSTEM - Social Media Enterprise

Hệ thống mạng xã hội doanh nghiệp được xây dựng theo kiến trúc Microservices với NestJS.

## 🎯 Tổng quan

SME-SYSTEM là hệ thống mạng xã hội doanh nghiệp với các chức năng:
- Quản lý người dùng và xác thực
- Tạo và quản lý nội dung (bài viết, bình luận)
- Tương tác xã hội (like, share, follow)
- Thông báo real-time
- Quản trị và phân tích

## 🏗️ Kiến trúc


## 🛠️ Các Service

### 🔐 Auth Service
- Xác thực người dùng (JWT)
- Đăng nhập/Đăng xuất
- Keycloak integration

### 👤 User Service
- Quản lý profile người dùng
- Upload avatar (Cloudinary)
- Tìm kiếm người dùng
- Event-driven với Kafka
- **Tech**: NestJS, PostgreSQL, Prisma

### 📝 Post Service
- Tạo/sửa/xóa bài viết
- Quản lý bình luận
- Upload media
- Search với Elasticsearch
- **Tech**: NestJS, Cassandra, Elasticsearch, Redis

### ❤️ React Service
- Quản lý reactions (like, dislike, etc.)
- Đếm tương tác
- **Tech**: NestJS, Cassandra, Redis

### 👥 Relationship Service
- Follow/Unfollow
- Quản lý followers/following
- **Tech**: NestJS, Neo4j, GraphQL

### 📰 Feed Service
- Timeline cá nhân
- Trang chủ người dùng
- **Tech**: NestJS, Redis, Kafka

### 🔔 Notification Service
- Thông báo real-time
- Thông báo tương tác, follow, mention
- **Tech**: NestJS, Cassandra, Kafka

### 🏥 Liveness Service
- Quản lý trạng thái online/offline
- Heartbeat mechanism với WebSocket
- 3 trạng thái: ONLINE, AWAY, OFFLINE
- **Tech**: NestJS, Socket.io, Redis

### 🎛️ Admin Service
- Dashboard quản trị
- Thống kê người dùng, bài viết
- Giám sát hệ thống
- **Tech**: Node.js, Express, Chart.js

## 🚀 Cài đặt

### 1. Khởi động Databases
```bash
cd DC
docker-compose up -d
```

### 2. Cài đặt dependencies
```bash
# Cài đặt cho từng service
cd user-service && npm install && npx prisma generate && cd ..
cd post-service && npm install && cd ..
# ... tương tự cho các service khác
```

### 3. Cấu hình Environment
```bash
cd user-service
cp env.example .env
# Chỉnh sửa .env
```

### 4. Chạy hệ thống
```bash
./start-all.sh
```

## 🗄️ Cơ sở dữ liệu

- **PostgreSQL** - User Service
- **Cassandra** - Post, Notification, Reaction Services
- **Neo4j** - Relationship Service
- **Redis** - Caching, Feed
- **Elasticsearch** - Full-text search

## 🔧 Công nghệ

- **Backend**: NestJS, Express.js
- **Databases**: PostgreSQL, Cassandra, Neo4j, Redis, Elasticsearch
- **Message Broker**: Apache Kafka
- **Auth**: JWT, Keycloak
- **Media**: Cloudinary
- **Tools**: Docker, Prisma, TypeScript

## 📈 Monitoring

- Admin dashboard
- Kafka events
- WebSocket real-time updates
- Database health checks

## 📝 License

MIT License

---

**SME-SYSTEM** - Social Media Enterprise Solution 🚀
