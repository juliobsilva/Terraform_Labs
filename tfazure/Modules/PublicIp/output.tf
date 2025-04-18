output "public_ip_id" {
  value = { for name, public_ip in azurerm_public_ip.public-ip : name => public_ip.id }
}
