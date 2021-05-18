/*
* PROJECT: Valheim Dedicated Server
* FILE: ROOT :: Provider.tf
* AUTHOR: Elijah Gartin [elijah.gartin@gmail.com]
* DATE: 2021 MAR 18
*/
 #Only use these if you are secure and not sharing your code. Otherwise use more secure methods discussed in README.md

# Configure the Digital Ocean Provider
terraform {
  required_providers {
    digitalocean = {
      source = "digitalocean/digitalocean"
      version = "2.8.0"
    }
  }
}
provider "digitalocean" {
  token = var.token
}