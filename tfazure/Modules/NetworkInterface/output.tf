output "output_network_interface" {
  value = { for name, nic in azurerm_network_interface.vm-nic : name => nic.id }
}