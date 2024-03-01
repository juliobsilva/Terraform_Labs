resource "azurerm_public_ip" "public-ip" {
  name                = "ip-pub"
  resource_group_name = var.resource_group_name
  location            = var.resource_group_location
  allocation_method   = "Static"

  tags = {
    environment = "ip-pub"
  }
}