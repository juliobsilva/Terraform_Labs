output "ip_address_pub" {
  value = aws_instance.web.associate_public_ip_address
}