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

variable "subnetid" {
  description = "Create subnet"
  type        = list(string)
  default     = []
}
