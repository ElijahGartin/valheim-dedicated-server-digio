/*
* PROJECT: Valheim Dedicated Server
* FILE: NETWORK :: Output.tf
* AUTHOR: Elijah Gartin [elijah.gartin@gmail.com]
* DATE: 2021 MAY 18
*/

#NETWORK DETAILS
output "vpc"    {
    value = digitalocean_vpc.valheimvpc.id
}