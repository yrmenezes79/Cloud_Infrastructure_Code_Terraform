resource "aws_instance" "Terraform" {
  ami           = var.ami_id
  instance_type = var.instance_type

  # Ajuste feito aqui: precisa ser uma lista, não string
  security_groups = var.securtity_aws

  user_data = file("install.sh")

  tags = {
    Name = "EC2-Terraform"
  }
}
