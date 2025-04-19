output "virtual_machine_ids" {
  value = { for index, machine in azurerm_virtual_machine.vms : index => machine.id }
}