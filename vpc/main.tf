# vpc/main.tf

resource "aws_vpc" "spotsat_vpc" {
  cidr_block = var.vpc_cidr
}

resource "aws_subnet" "spotsat_subnet1" {
  vpc_id            = aws_vpc.spotsat_vpc.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "us-east-1a"
}

resource "aws_subnet" "spotsat_subnet2" {
  vpc_id            = aws_vpc.spotsat_vpc.id
  cidr_block        = "10.0.2.0/24"
  availability_zone = "us-east-1b"
}

resource "aws_internet_gateway" "spotsat_igw" {
  vpc_id = aws_vpc.spotsat_vpc.id
}

resource "aws_route_table" "spotsat_rt" {
  vpc_id = aws_vpc.spotsat_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.spotsat_igw.id
  }
}

resource "aws_route_table_association" "spotsat_a" {
  subnet_id      = aws_subnet.spotsat_subnet1.id
  route_table_id = aws_route_table.spotsat_rt.id
}

resource "aws_route_table_association" "spotsat_b" {
  subnet_id      = aws_subnet.spotsat_subnet2.id
  route_table_id = aws_route_table.spotsat_rt.id
}
