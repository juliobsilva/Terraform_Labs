output "sub_id" {
  value = { for index, value in azurerm_subnet.subnets : index => value.id }
}
