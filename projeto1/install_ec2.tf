#Criando uma instancia EC2
resource "aws_instance" "Terraform" {
  count                  = var.count_instance
  ami                    = var.aws_ami
  instance_type          = var.aws_instance_type
  security_groups        = ["sg_DefaultWebserver"]
  key_name               = "terra2"
  user_data              = file("install.sh")

  tags = {
    Name = "ec2-instance-terraform-tech${count.index + 1}"
  }
}
