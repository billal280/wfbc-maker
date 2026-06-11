#!/bin/bash

set -e

echo "🚀 Bootstrapping AI Factory..."

cd /opt/ai-factory/bootstrap

# INSTALL DOCKER
if ! command -v docker &> /dev/null
then
  curl -fsSL https://get.docker.com | sh
fi

systemctl enable docker
systemctl start docker

# INSTALL COMPOSE PLUGIN

apt-get update -y
apt-get install -y docker-compose-plugin

# START STACK

cd /opt/ai-factory/bootstrap && docker compose up -d

echo "AI Factory ready"
echo "➡ Open WebUI: http://SERVER_IP:3000"
echo "➡ Qdrant: http://SERVER_IP:6333"