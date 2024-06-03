# vpc/outputs.tf

output "vpc_id" {
  value = aws_vpc.spotsat_vpc.id
}