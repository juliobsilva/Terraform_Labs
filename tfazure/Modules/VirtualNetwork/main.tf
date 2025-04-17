
resource "azurerm_virtual_network" "virtual_network" {
  for_each            = { for idx, network in var.virtual_network_info : idx => network }
  name                = each.value.vnet_name
  resource_group_name = var.resource_group_name
  location            = var.resource_group_location
  address_space       = each.value.address_space
  dns_servers         = each.value.dns_servers

  tags = {
    environment = var.environment
  }

}
