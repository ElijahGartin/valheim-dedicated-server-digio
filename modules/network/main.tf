/*
* PROJECT: Valheim Dedicated Server
* FILE: NETWORK :: Main.tf
* AUTHOR: Elijah Gartin [elijah.gartin@gmail.com]
* DATE: 2021 MAY 18
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

#RANGE 10.10.10.x VPC NETWORK
resource "digitalocean_vpc" "valheimvpc" {
  name     = var.vpcname
  region   = var.region
  ip_range = var.ip_range
}
