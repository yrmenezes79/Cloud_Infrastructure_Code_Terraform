# Recurso para criar uma instância EC2
resource "aws_instance" "example" {
  ami           = "ami-0360c520857e3138f"  # AMI do Ubuntu 20.04 (exemplo, pode variar conforme a região)
  instance_type = "t3.micro"               # Tipo de instância (elegível para Free Tier)
}

# Output para mostrar o IP público da instância
output "instance_public_ip" {
  value = aws_instance.example.public_ip
}
