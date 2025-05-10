variable "count_instance" {
  description = "Quantidade de instancias"
  type        = number
  default     = 2
}

variable "aws_ami" {
  description = "aws ami default"
  type        = string
  default     = "ami-084568db4383264d4"
}

variable "aws_instance_type" {
  description = "aws instance default"
  type        = string
  default     = "t2.micro"
}

variable "aws_region" {
  description = "aws region default"
  type        = string
  default     = "us-east-1"
}

variable "aws_key" {
  description = "aws region default"
  type        = string
  default     = "mack2"
}
variable "securtity_aws" {
  description = "aws SG default"
  type        = string
  default     = "sg_DefaultWebserver"
}
