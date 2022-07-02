output "ip_address_pub" {
  value = aws_instance.web[*].public_ip
}
