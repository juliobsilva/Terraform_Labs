resource "azurerm_network_security_group" "security_groups" {
  name                = var.security_group_name
  resource_group_name = var.resource_group_name
  location            = var.resource_group_location
 }
