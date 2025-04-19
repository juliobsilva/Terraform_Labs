resource "azurerm_virtual_machine" "vms" {
  for_each              = toset(var.vms_info)
  name                  = each.value
  location              = var.resource_group_location
  resource_group_name   = var.resource_group_name
  network_interface_ids = [var.interface_ids[each.key]]
  vm_size               = "Standard_B2s"

  delete_os_disk_on_termination = true

  storage_image_reference {
    publisher = "Canonical"
    offer     = "ubuntu-24_04-lts"
    sku       = "ubuntu-pro"
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
    admin_username = "jcroot"
    admin_password = "jcroot.123456789"
  }

  os_profile_linux_config {
    disable_password_authentication = false
  }
}