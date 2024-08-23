# Base image Node.js versi 14 dengan distro linux alpine
FROM node:14-alpine

# Working directory untuk aplikasi adalah app
WORKDIR /app

# Menyalin seluruh source code ke working directory di container
COPY . .

# Menambahkan env var NODE_ENV ke production dan DB_HOST ke item-db untuk database host
ENV NODE_ENV=production DB_HOST=item-db

# Instalasi package dependencies untuk production dan build aplikasi
RUN npm install --production --unsafe-perm && npm run build

# Ekspos port yang digunakan aplikasi ke 8080
EXPOSE 8080

# Jalankan perintah npm start untuk memulai server
CMD ["npm", "start"]