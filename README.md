# Valheim Dedicated Server Digital Ocean IaaS Build

## Terraform

### 2021 MAY 25

## Disclaimer/Legal

All use of these tools are the sole responsibility of the user applying the build in their own Cloud Environments.  Elijah Gartin/Falkon, Thunder Rock Gaming, ZeroBandwidth/And All Aliases, and any affiliated associates assume no liability for any issues or costs associated with utilizing these tools. You accept these terms and assume all responsibility by using and deploying any asset or artifact in this repository.

## About

This repository is to build a Valheim Dedicated Server in Digital Ocean.  We assume you know how to use Digital Ocean.

Pulling from Ubuntu Server immutable images and a dynamic Valheim Build library created by ZeroBandwidth and associates. [Application Build Github](https://github.com/Nimdy/Dedicated_Valheim_Server_Script.git). 

All critiques are welcome via the [Github Project](https://github.com/users/ElijahGartin/projects/2) or through [Discord](https://discord.gg/Trwr3Ty) in the Valheim or Science and Technology areas. To access those areas in discord, click on the :evergreen_tree: and/or :rocket: emoji reactions to gain access to those respective channel groups in the #channel-picker after accepting the terms of service discord prompt.

### Repositories

| Repository  |
| ----------- |
| [Valheim Terraform AWS](https://github.com/ElijahGartin/valheim-dedicated-server-aws)     |
| [Valheim Terraform Azure](https://github.com/ElijahGartin/valheim-dedicated-server-azure)   |
| [Valheim Terraform Google Cloud Platform](https://github.com/ElijahGartin/valheim-dedicated-server-gcp)            |
| [Valheim Terraform Digital Ocean](https://github.com/ElijahGartin/valheim-dedicated-server-digio)            |

## Prerequisites

  - [Digital Ocean Account](https://m.do.co/c/9d2217a2725c)
     - [Digital Ocean API Token](https://cloud.digitalocean.com/account/api/tokens)
  - [Terraform](https://www.terraform.io/downloads.html) (Tested on version 0.15.3)

## References

  - [Digital Ocean Docs](https://docs.digitalocean.com/)
  - [Digital Ocean Provider Docs](https://registry.terraform.io/providers/digitalocean/digitalocean/latest)
  - [Digital Ocean Developer Docs](https://developers.digitalocean.com/libraries/)
  - [Digital Ocean Datacenters](https://docs.digitalocean.com/products/platform/availability-matrix/)
    - [Digital Ocean Ping Test](https://cloudpingtest.com/digital_ocean)
  - [Digital Ocean Server(Droplet)Sizing API](https://developers.digitalocean.com/documentation/v2/#list-all-sizes)

## Steps

You'll be editing some lines in the `ROOT:vars.tf` file for the local variables between line 8 and 18. Steps described below. Mileage may vary depending on what data center you try to push to.

You'll notice some of the taxonomy in referring to files such as `ROOT:filename`.  Root will be the root of the folder structure. Any modules will change the name of `ROOT` to `NETWORK` for example where there is another grouping of similarily named files.  This is a Terraform thing that some people may not be familiar with.

1. `ROOT:vars.tf`: Use `curl https://ipinfo.io/ip` to obtain your IP and input it in the locals variable for `your_ip` in the this file. This is essential for you to be able to SSH from your box.  If you intend to use a bastion host, make sure you're putting in the ip for the bastion host.

2. `ROOT:vars.tf`: Generate an API Token in Digital Ocean and then edit the vars file to input your API Token file after generating it for your account. 
  - [Digital Ocean API Token Dashboard](https://cloud.digitalocean.com/account/api/tokens)

3. `ROOT:vars.tf`: Choose your Digital Ocean Region
  - [Digital Ocean Region Names](https://docs.digitalocean.com/products/platform/availability-matrix/)
   
4. `ROOT:main.tf`: Create a public key pair and update variable to pull the public key file through the `keyname` variable. This is so you can ssh to your virtual machine. Change line 43, if your ssh key name IS NOT `id_rsa.pub` in the `~/.ssh` folder.
    - [Terraform DIGIO SSH Doc](https://registry.terraform.io/providers/digitalocean/digitalocean/latest/docs/resources/ssh_key)

5. Once you've saved all your changes, open a terminal/command prompt to the location of this repository and run the following commands in succession:
    - `terraform init`
    - `terraform apply`

  You can destroy all assets when you are completed using `terraform destroy`

  **WARNING**
  Make sure you backup your game if you've made progress and want to keep it. If it becomes additionally requested I may add more functionality to play with the backup functionality that ZeroBandwidth and crew have developed.

  Alternatively you can just backup with their scripts and then use SCP to download the backup.

  Example:
  ```scp -i KEYNAME ubuntu@IPADDRESS:/home/steam/backups/valheim-backup-DATEUUID.tgz ~/Downloads/valheim-backup-DATEUUID.tgz```

  You can then reupload this to Data Blobs and have it download from the `/scripts/bootstrap.sh` script if you care to if you have to rebuild a server.

## Network Schema

10.10.10.0/24 - Main Subnet (Be careful for subnet conflicts in Digital Ocean. If you have this issue, change line 24 in `ROOT:main.tf` to provision in a non-conflicting CIDR range.)

The server will currently build as a `s-2vcpu-4gb` (2vCPU 4GB RAM). Depending on the size of the world and how many users, you may need to adjust the size. With Terraform, it should be as simple as updating the line of code in `ROOT:main.tf` line 41 with the new sizing and re-running `terraform apply`. Make sure you stop the server and backup before doing it, just in case.

`s-1vcpu-1gb` - for testing
`sfo-3` - for data center

## Support for Infrastructure as Code

Author: Elijah Gartin (Falkon)

- [Website](https://www.thunderrockgaming.com)
- [Discord](https://discord.gg/Trwr3Ty)
- [Falkon Twitch](https://twitch.tv/FalkonTTV)

## Support for Valheim Server Scripts

Author: ZeroBandwith (And Many More)

- [ZeroBandwith Discord](https://discord.gg/ejgQUfc)
- [ZeroBandwith Github Repo](https://github.com/Nimdy/Dedicated_Valheim_Server_Script.git)