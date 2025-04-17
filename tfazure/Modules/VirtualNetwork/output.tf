#output "virtual_network_name" {
#  value = [for v in var.virtual_network_info : v.vnet_name ]
#}
output "virtual_network_name" {
  value = lookup({ for v in var.virtual_network_info : v.vnet_name => v.vnet_name }, "VnetLab3", "Não encontrado")
}
