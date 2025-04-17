
output "resource_group_name" {
  value = module.ModuleResourceGroup.resource_group_name
}

output "resource_group_location" {
  value = module.ModuleResourceGroup.resource_group_location
}


output "sucurity_group_name" {
  value = module.ModuleSecurityGroupRules.sucurity_group_name
}


output "formatted_rules" {
  value = module.ModuleSecurityGroupRules.formatted_rules
}

output "ssh_rule_info" {
  value = module.ModuleSecurityGroupRules.ssh_rule_info
}


output "virtual_network_name" {
  value = module.ModuleVirtualNetwork.virtual_network_name
}


output "sub_id" {
  value = module.ModuleSubNet.sub_id
}

output "public_ip_id" {
  value = module.ModulePublicIp.public_ip_id
}

output "output_network_interface" {
  value = module.ModuleNetworkInterface.output_network_interface
}