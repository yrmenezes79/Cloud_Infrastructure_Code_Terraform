variable "aws_region" {
  description = "A região da AWS"
  default     = "us-east-1"
}

variable "instance_type" {
  description = "O tipo da instância EC2"
  default     = "t2.micro"
}

variable "ami_id" {
  description = "ID da AMI"
  default     = "ami-0b6c6ebed2801a5cb"
}
