# Outputs como o endereço IP da instância EC2
output "ec2_public_ip" {
  description = "Endereço IP público da instância EC2"
  value       = aws_instance.web_server.public_ip
}
