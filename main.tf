resource "aws_instance" "example" {
  ami           = var.ami_id
  instance_type = var.instance_type
}
output "instance_public_ip" {
  value = aws_instance.example.public_ip
}
