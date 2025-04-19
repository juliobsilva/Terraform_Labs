resource "azurerm_managed_disk" "managed_disk" {
  for_each = { for index, disk in var.list_manage_disk : index => disk }

  name                 = "${each.value.name}-disk-01"
  location             = var.resource_group_location
  resource_group_name  = var.resource_group_name
  storage_account_type = each.value.storage_account_type
  create_option        = each.value.create_option
  disk_size_gb         = each.value.disk_size_gb
}

resource "azurerm_virtual_machine_data_disk_attachment" "disk_attachment" {
  for_each = azurerm_managed_disk.managed_disk

  managed_disk_id    = each.value.id
  virtual_machine_id = var.vm_id
  lun                = 1 # ou um valor calculado, veja nota abaixo
  caching            = "ReadWrite"
}