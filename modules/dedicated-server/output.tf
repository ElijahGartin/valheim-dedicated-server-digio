/*
* PROJECT: Valheim Dedicated Server
* FILE: DEDICATED-SERVER :: Output.tf
* AUTHOR: Elijah Gartin [elijah.gartin@gmail.com]
* DATE: 2021 MAY 19
*/

output "public_ip"  {
    value = digitalocean_droplet.server.ipv4_address
}

output "server_id"  {
    value = digitalocean_droplet.server.id
}
