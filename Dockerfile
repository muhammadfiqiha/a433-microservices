# Base image Node.js versi 14 dengan distro linux alpine
FROM node:18-alpine

# Working directory untuk aplikasi adalah app
WORKDIR /src

# Menyalin seluruh source code ke working directory di container
COPY . .

# Instalasi package dependencies dan build aplikasi
RUN npm install

# Ekspos port yang digunakan aplikasi ke 8080
EXPOSE 3001

# Jalankan perintah npm start untuk memulai server
CMD ["npm", "start"]