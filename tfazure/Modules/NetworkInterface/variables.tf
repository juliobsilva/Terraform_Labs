variable "resource_group_name" {
  description = "Create resource group name"
  type        = string
}

variable "resource_group_location" {
  description = "Create resource group location"
}


variable "subnetid" {
  description = "Create subnet"
  type        = map(string)
}

variable "ip-pub" {
  description = "Create ip-pubs"
  type        = map(string)
}

variable "vms_info" {
  description = "Vms list"
  type        = list(string)
}

