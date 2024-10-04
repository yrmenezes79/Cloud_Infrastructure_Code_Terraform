variable "count_instance" {
  description = "Quantidade de instancias"
  type        = number
  default     = 2
}

variable "aws_ami" {
  description = "aws ami default"
  type        = string
  default     = "ami-0866a3c8686eaeeba"
}

variable "aws_instance_type" {
  description = "aws instance default"
  type        = string
  default     = "t2.micro"
}
