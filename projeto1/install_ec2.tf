#Criando uma instancia EC2
resource "aws_instance" "Terraform" {
  count                  = var.count_instance
  ami                    = var.aws_ami
  instance_type          = var.aws_instance_type
  security_groups        = var.securtity_aws
  key_name               = var.aws_key
  user_data              = file("install.sh")

  tags = {
    Name = "ec2-instance-terraform-tech${count.index + 1}"
  }
}
