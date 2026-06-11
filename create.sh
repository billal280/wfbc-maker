#!/bin/bash

set -e

source .env

cd terraform

terraform init

terraform apply -var="hcloud_token=$HETZNER_TOKEN" -var="server_name=$SERVER_NAME" -var="server_type=$SERVER_TYPE" -var="location=$LOCATION" -auto-approve

IP=$(terraform output -raw server_ip)

echo ""
echo "Serveur créé :"
echo "$IP"