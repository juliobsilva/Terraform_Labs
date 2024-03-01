output "sucurity_group_name" {
  value = { for k, v in var.listrules : k => v.name }
}



output "formatted_rules" {
  value = [for rule in var.listrules : {
    name                       = rule.name
    priority                   = rule.priority
    direction                  = rule.direction
    access                     = rule.access
    protocol                   = upper(rule.protocol)
    source_port_range          = rule.source_port_range
    destination_port_range     = rule.destination_port_range
    source_address_prefix      = rule.source_address_prefix
    destination_address_prefix = rule.destination_address_prefix
  }]
}


locals {
  security_group_rules_by_name = { for rule in var.listrules : rule.name => rule }
}

output "ssh_rule_info" {
  value = element([ for p, v in local.security_group_rules_by_name : v.name ], 0)
  
}

output "ftp_rule_info" {
  value = local.security_group_rules_by_name
}
