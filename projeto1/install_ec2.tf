resource "aws_instance" "Terraform" {
  ami           = var.ami_id
  instance_type = var.instance_type
  key_name      = var.aws_key

  vpc_security_group_ids = [
    aws_security_group.allow_ssh_http.id
  ]

  user_data = file("install_rhel.sh")

  tags = {
    Name = "EC2-Terraform"
  }
}
