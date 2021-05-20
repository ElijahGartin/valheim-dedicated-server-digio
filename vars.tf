/*
* PROJECT: Valheim Dedicated Server
* FILE: ROOT :: Vars.tf
* AUTHOR: Elijah Gartin [elijah.gartin@gmail.com]
* DATE: 2021 MAY 20
*/
#curl https://ipinfo.io/ip
variable "your_ip" {
    description = "Your public IP address for SSH access."
    default = "{YOUR_IP}/32"
}
#https://cloud.digitalocean.com/account/api/tokens
variable "token"    {
    description = "Digital Ocean API Token."
    default = "{YOUR_TOKEN}"
}
#https://docs.digitalocean.com/products/platform/availability-matrix/
variable "region"  {
    description = "Digital Ocean Datacenter Code. E.g. SFO3."
    default = "{YOUR_REGION}"
}    