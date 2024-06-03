# variables.tf

variable "region" {
  description = "regiao aonde vai ser feito o deploy"
  default     = "us-east-1"
}

variable "vpc_cidr" {
  description = "bloco de CIDR para minha VPC"
  default     = "10.0.0.0/16"
}