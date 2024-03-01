variable "security_group_name" {
  description = "Create security group"
  type        = string
}

variable "resource_group_name" {
  description = "Create resource groups"
  type        = string
}

variable "resource_group_location" {
  description = "Create location"
  type        = string
}

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
  default = []
}