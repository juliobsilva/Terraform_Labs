resource "azurerm_subnet" "subnets" {
  for_each             = { for idx, subnet in var.subnet_info : idx => subnet }
  name                 = each.value.subnet_name
  resource_group_name  = var.resource_group_name
  virtual_network_name = each.value.vnet_name
  address_prefixes     = each.value.address_prefixes
}


