resource "azurerm_network_security_group" "security_groups" {
  name                = var.security_group_name
  resource_group_name = var.resource_group_name
  location            = var.resource_group_location
}


resource "azurerm_subnet_network_security_group_association" "security_association" {
  for_each                  = var.subnetid
  subnet_id                 = each.value
  network_security_group_id = azurerm_network_security_group.security_groups.id
}
