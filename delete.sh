#!/bin/bash

set -e

source .env

cd terraform

terraform destroy -var="hcloud_token=$HETZNER_TOKEN" -var="server_name=$SERVER_NAME" -var="server_type=$SERVER_TYPE" -var="location=$LOCATION" -auto-approve