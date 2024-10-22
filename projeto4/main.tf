# Criar a VPC
resource "aws_vpc" "main_vpc" {
  cidr_block = "10.0.0.0/16"
}

# Criar a sub-rede pública
resource "aws_subnet" "public_subnet" {
  vpc_id                  = aws_vpc.main_vpc.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = true
}

# Criar a sub-rede privada
resource "aws_subnet" "private_subnet" {
  vpc_id     = aws_vpc.main_vpc.id
  cidr_block = "10.0.2.0/24"
}

# Criar o Internet Gateway
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main_vpc.id
}

# Criar a tabela de rotas para a sub-rede pública
resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.main_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
}

# Associar a sub-rede pública à tabela de rotas
resource "aws_route_table_association" "public_association" {
  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.public_rt.id
}

# Criar o Security Group para a instância EC2
resource "aws_security_group" "ec2_sg" {
  vpc_id = aws_vpc.main_vpc.id

  # Permitir tráfego SSH (porta 22)
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Permitir tráfego para MySQL (porta 3306)
  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["10.0.0.0/16"]
  }

  # Permitir todo o tráfego de saída
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Criar o Security Group para o banco de dados RDS
resource "aws_security_group" "rds_sg" {
  vpc_id = aws_vpc.main_vpc.id

  # Permitir tráfego MySQL apenas da sub-rede pública (instância EC2)
  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["10.0.1.0/24"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Criar a instância EC2
resource "aws_instance" "ec2_instance" {
  ami           = "ami-0866a3c8686eaeeba" 
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.public_subnet.id
  security_groups = [aws_security_group.ec2_sg.name]

  # Configuração para se conectar ao banco de dados RDS
  user_data = <<-EOF
              #!/bin/bash
              apt-get update -y
              apt-get install -y mysql-client
              EOF

  tags = {
    Name = "WebServer"
  }
}

# Criar a instância RDS
resource "aws_db_instance" "rds_instance" {
  allocated_storage    = 20
  engine               = "mysql"
  engine_version       = "8.0"
  instance_class       = "db.t2.micro"
  name                 = "mydb"
  username             = "admin"
  password             = "admin123"
  parameter_group_name = "default.mysql8.0"
  skip_final_snapshot  = true

  # Conectar a instância RDS à sub-rede privada
  db_subnet_group_name = aws_db_subnet_group.rds_subnet_group.name
  vpc_security_group_ids = [aws_security_group.rds_sg.id]

  tags = {
    Name = "MyRDSInstance"
  }
}

# Criar o grupo de sub-redes para o RDS
resource "aws_db_subnet_group" "rds_subnet_group" {
  name       = "rds-subnet-group"
  subnet_ids = [aws_subnet.private_subnet.id]

  tags = {
    Name = "RDSSubnetGroup"
  }
}

# Output do IP público da instância EC2
output "ec2_public_ip" {
  value = aws_instance.ec2_instance.public_ip
}

# Output do endpoint da instância RDS
output "rds_endpoint" {
  value = aws_db_instance.rds_instance.endpoint
}
