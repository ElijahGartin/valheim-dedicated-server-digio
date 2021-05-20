/*
* PROJECT: Valheim Dedicated Server
* FILE: ROOT :: Main.tf
* AUTHOR: Elijah Gartin [elijah.gartin@gmail.com]
* DATE: 2021 MAY 20
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

# BUILD NETWORK
module "network" {
    source    = "./modules/network"
    token     = var.token
    vpcname   = "valheimvpc"
    ip_range  = "10.10.10.0/24"
    region    = var.region

}

module "securitygroups" {
    source    = "./modules/security-groups"
    token     = var.token    
    your_ip   = var.your_ip
    droplet_ids = module.server.server_id
}

# BUILD SERVER
module "server" {
    source          = "./modules/dedicated-server"
    token           = var.token
    region          = var.region
    instance_type   = "s-2vcpu-4gb" #for testing use:  `s-1vcpu-1gb`
    vpc_uuid        = module.network.vpc
    ssh_keys        = file("~/.ssh/id_rsa.pub")
    user_data       = file("./scripts/bootstrap.sh")
}
