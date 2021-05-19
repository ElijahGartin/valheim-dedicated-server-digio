/*
* PROJECT: Valheim Dedicated Server
* FILE: ROOT :: Vars.tf
* AUTHOR: Elijah Gartin [elijah.gartin@gmail.com]
* DATE: 2021 MAR 13
*/

variable "your_ip" {
    default = "{YOUR_IP}/32"
}

variable "token"    {
    description = "Digital Ocean API Token"
    default = "{YOUR_TOKEN}"
}
variable "region"  {
    default = "sfo3"
}   

variable "project"  {
    default = "{PROJECT_NAME}"
}
    