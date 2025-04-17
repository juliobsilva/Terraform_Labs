variable "resource_group_name" {
  description = "Create resource groups"
  type        = string
}

variable "resource_group_location" {
  description = "Create location"
  type        = string
}


variable "vms_info" {
  description = "Mapa com as configurações das VMs"
  type        = list(string)
}

variable "interface_ids" {
  type = map(string)
}