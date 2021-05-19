/*
* PROJECT: Valheim Dedicated Server
* FILE: ROOT :: Vars.tf
* AUTHOR: Elijah Gartin [elijah.gartin@gmail.com]
* DATE: 2021 MAR 13
*/

variable "your_ip" {
    default = "{YOURIP}/32"
}

variable "token"    {
    description = "Digital Ocean API Token"
    default = "{YOURTOKEN}"
}
variable "region"  {
    default = "sfo3"
}   

variable "project"  {
    default = "{PROJECT_NAME}"
}
    