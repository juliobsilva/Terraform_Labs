resource "azurerm_network_security_rule" "security_rule" {
  for_each = { for idx, rule in var.listrules : idx => rule }

  name                        = each.value.name
  priority                    = each.value.priority
  direction                   = each.value.direction
  access                      = each.value.access
  protocol                    = each.value.protocol
  source_port_range           = each.value.source_port_range
  destination_port_range      = each.value.destination_port_range
  source_address_prefix       = can(index(each.value.source_address_prefix, 0)) ? each.value.source_address_prefix[0] : "*"
  destination_address_prefix  = can(index(each.value.destination_address_prefix, 0)) ? each.value.destination_address_prefix[0] : "*"
  resource_group_name         = var.resource_group_name
  network_security_group_name = var.security_group_name

}
