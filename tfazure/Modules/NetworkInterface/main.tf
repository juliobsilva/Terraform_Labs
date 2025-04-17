resource "azurerm_network_interface" "vm-nic" {
  for_each            = toset(var.vms_info)
  name                = "NIC-${each.value}"
  resource_group_name = var.resource_group_name
  location            = var.resource_group_location

  ip_configuration {
    name                          = "internal"
    subnet_id                     = var.subnetid[0]
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = var.ip-pub[each.value]
  }
}


