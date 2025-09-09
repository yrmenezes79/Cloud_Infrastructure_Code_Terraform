# Busca a VPC padrão da sua conta na região especificada
data "aws_vpc" "default" {
  default = true
}

# Cria o Security Group associado à VPC padrão
resource "aws_security_group" "acesso-geral-web" {
  name        = "acesso-geral-web"
  description = "Permite acesso SSH e HTTP"
  vpc_id      = data.aws_vpc.default.id # <--- CORREÇÃO PRINCIPAL: Associando à VPC

  # Regra de entrada para SSH (Porta 22)
  ingress {
    description      = "SSH from anywhere"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  # Regra de entrada para HTTP (Porta 80) para acessar o Apache
  ingress {
    description      = "HTTP from anywhere"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  # Regra de saída para permitir todas as conexões de saída
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "acesso-geral-web-sg"
  }
}
