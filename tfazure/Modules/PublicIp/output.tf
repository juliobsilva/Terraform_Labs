output "public_ip_id" {
  value = { for vm_name, public_ip in azurerm_public_ip.public-ip : vm_name => public_ip.id }
}
