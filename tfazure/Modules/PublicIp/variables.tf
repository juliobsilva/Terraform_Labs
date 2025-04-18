variable "resource_group_name" {
  description = "Create resource groups"
  type        = string
}

variable "resource_group_location" {
  description = "Create location"
  type        = string
}

variable "vms_info" {
  description = "Vms list"
  type        = list(string)
}
