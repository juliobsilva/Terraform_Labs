resource "azurerm_public_ip" "public-ip" {
  for_each            = toset(var.vms_info)
  name                = "PUB-IP${each.value}"
  resource_group_name = var.resource_group_name
  location            = var.resource_group_location
  allocation_method   = "Static"

  tags = {
    environment = "ip-pub"
  }
}