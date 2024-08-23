#!/bin/bash

# Build image dengan nama item-app dan tag v1
docker build -t item-app:v1 .

# Melihat daftar image di lokal
docker images

# Mengubah nama image agar sesuai dengan format Docker Registry (docker hub/github packages)
# nama jika ke docker hub : <username-dockerhub>/<repo-dockerhub/image-name>:<tag>
# nama jika ke github pkg : ghcr.io/<username-github>/<repo/image-name>:<tag>
docker tag item-app:v1 ghcr.io/muhammadfiqiha/item-app:v1

# login ke docker hub/github packages, jika docker hub, password menggunakan kata sandi untuk login
# jika github packages, tambahkan ghcr.io setelah login, dan gunakan Personal Access Token 
# dengan permission write:packages
echo $PAT_GITHUB | docker login ghcr.io -u muhammadfiqiha --password-stdin

# Mengunggah docker image ke registry (docker hub/github packages)
docker push ghcr.io/muhammadfiqiha/item-app:v1