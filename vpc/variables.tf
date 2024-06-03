# vpc/variables.tf

variable "vpc_cidr" {
  description = "bloco de CIDR para minha VPC"
  default     = "10.0.0.0/16"
}