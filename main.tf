/*
* PROJECT: Valheim Dedicated Server
* FILE: ROOT :: Main.tf
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
    #droplet_ids = module.server.server_id
}
/*
# BUILD SERVER
module "server" {
    source                  = "./modules/dedicated-server"
    instance_type           = "e2-standard-2"
    zone                    = var.zone
    vpc                     = module.network.vpc
    subnet_id               = module.network.network_subnet_id
    service_account_email   = var.service_account_email
    disk-image-type         = "pd-standard"
    disk-image-size         = 30
    user_data               = file("./scripts/bootstrap.sh")
}
*/