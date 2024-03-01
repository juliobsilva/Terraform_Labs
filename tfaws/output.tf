output "ip_address_pub" {
  value = aws_instance.web[*].public_ip
  description = "Mostrando saido do IP publico"
}
