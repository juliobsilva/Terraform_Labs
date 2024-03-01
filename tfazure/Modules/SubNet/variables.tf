variable "resource_group_name" {
  description = "Create resource group name"
  type = string
}

variable "subnet_info" {
  description = "Infos"
  type = list(object({
    vnet_name = string
    subnet_name = string
    address_prefixes = list(string)
  }))
  default = []
}
