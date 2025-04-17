variable "listrules" {
  type = list(object({
    name                       = string
    priority                   = number
    direction                  = string
    access                     = string
    protocol                   = string
    source_port_range          = string
    destination_port_range     = number
    source_address_prefix      = list(string)
    destination_address_prefix = list(string)
    }
  ))
}

variable "virtual_network_info" {
  description = "Infos"
  type = list(object({
    vnet_name     = string
    address_space = list(string)
    dns_servers   = list(string)
  }))
  default = []
}

variable "subnet_info" {
  description = "Infos"
  type = list(object({
    vnet_name        = string
    subnet_name      = string
    address_prefixes = list(string)
  }))
  default = []
}


variable "ip_configuration_info" {
  type = list(object({
    name               = string
    address_allocation = string
  }))
  default = []
}


variable "resource_group_info" {
  description = "Create resource groups"
  type = list(object({
    name     = string
    location = string
  }))
  default = []
}

variable "vms_info" {
  description = "Vms list"
  type        = list(string)
}
