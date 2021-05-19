/*
* PROJECT: Valheim Dedicated Server
* FILE: DEDICATED-SERVER :: Main.tf
* AUTHOR: Elijah Gartin [elijah.gartin@gmail.com]
* DATE: 2021 MAY 19
*/
terraform {
  required_providers {
    digitalocean = {
      source = "digitalocean/digitalocean"
      version = ">= 2.8.0"
    }
  }
}
provider "digitalocean" {
  token = var.token
}

resource "digitalocean_ssh_key" "key" {
  name       = "SSH Key from Ubuntu Dev"
  public_key = var.ssh_keys
}

resource "digitalocean_droplet" "server" {
  name      = "valheim-server"
  image     = "ubuntu-18-04-x64"
  size      = var.instance_type
  region    = var.region
  vpc_uuid  = var.vpc_uuid
  ssh_keys  = [digitalocean_ssh_key.key.fingerprint]
  user_data = var.user_data
}