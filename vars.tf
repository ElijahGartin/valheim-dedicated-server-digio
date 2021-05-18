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
    default = "{YOUR TOKEN}"
}
variable "region"  {
    default = "us-central1" #IOWA
}   

variable "project"  {
    default = "{PROJECT_NAME}"
}
    