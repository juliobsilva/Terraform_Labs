variable "resource_group_name" {
  description = "Create resource groups"
  type = string
}

variable "resource_group_location" {
  description = "Create location"
  type = string
}

variable "virtual_network_info" {
  description = "Infos"
  type = list(object({
    vnet_name = string
    address_space = list(string)
    dns_servers = list(string)
  }))
  default = []
}

variable "environment" {
  description = "Create environment"
  type = string
}




/*

locals {
  get_name_vnet = element([ for p, v in var.virtual_network_info : v.virtual_network_name ], 0)
}


#variable "security_group_id" {
#  description = "Create security_group"
#  type = string
#}
*/



