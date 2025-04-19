variable "resource_group_name" {
  description = "Create resource groups"
  type        = string
}

variable "resource_group_location" {
  description = "Create location"
  type        = string
}


variable "list_manage_disk" {
  description = "Manage disk"
  type = list(object({
    name                 = string
    storage_account_type = string
    create_option        = string
    disk_size_gb         = number
  }))
  default = []

  validation {
    condition = alltrue([for disk in var.list_manage_disk : length(disk.name) > 0])
    error_message = "Cada disco gerenciado deve ter pelo menos um nome."
  }
}

variable "vm_id" {
  type = string
}
