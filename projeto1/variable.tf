variable "aws_region" {
  description = "Região AWS"
  type        = string
  default     = "us-east-1"
}

variable "aws_profile" {
  description = "Perfil de credenciais AWS"
  type        = string
  default     = "default"
}

variable "ami_id" {
  description = "AMI utilizada para criar a instância"
  type        = string
  default     = "ami-0360c520857e3138f"
}

variable "instance_type" {
  description = "Tipo da instância EC2"
  type        = string
  default     = "t2.micro"
}

variable "security_groups" {
  description = "Lista de security groups"
  type        = list(string)
  default     = ["allow_ssh_http"]
}

variable "aws_key" {
  description = "Nome do key pair AWS"
  type        = string
  default     = "XXX" #ALTERAR PARA CHAVE CORRETA
}
