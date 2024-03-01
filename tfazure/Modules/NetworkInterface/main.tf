resource "azurerm_network_interface" "vm-nic" {
  name                = "vm-nic"
  resource_group_name = var.resource_group_name
  location            = var.resource_group_location
  
  ip_configuration {
    name                          = "internal"
    subnet_id                     = var.subnetid
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = var.ip-pub
  }
}


