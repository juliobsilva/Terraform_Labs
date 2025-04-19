output "managed_disk" {
  value = { for index, disk in azurerm_managed_disk.managed_disk : index => disk.id }
}
