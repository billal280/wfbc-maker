terraform {
  required_providers {
    hcloud = {
      source = "hetznercloud/hcloud"
    }
  }
}

provider "hcloud" {
  token = var.hcloud_token
}

resource "hcloud_server" "ai" {

  name = var.server_name

  image = "ubuntu-24.04"

  server_type = var.server_type

  location = var.location

  ssh_keys = [
    "terraform-hetzner"
  ]

  user_data = file("../bootstrap/cloud-init.yaml")
}