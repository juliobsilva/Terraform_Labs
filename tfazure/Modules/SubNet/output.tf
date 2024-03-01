output "sub_id" {
  value = [ for v in azurerm_subnet.subnets: v.id ]
}

