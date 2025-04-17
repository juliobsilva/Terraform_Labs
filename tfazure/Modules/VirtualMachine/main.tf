resource "azurerm_virtual_machine" "vms" {
  for_each              = toset(var.vms_info)
  name                  = each.value
  location              = var.resource_group_location
  resource_group_name   = var.resource_group_name
  network_interface_ids = [var.interface_ids[each.key]]
  vm_size               = "Standard_F2"

  storage_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }

  storage_os_disk {
    name              = "osdisk-${each.key}"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }

  os_profile {
    computer_name  = each.value
    admin_username = "juliobsilva"
    admin_password = "Jlo.123456789"
  }

  os_profile_linux_config {
    disable_password_authentication = false
  }
}