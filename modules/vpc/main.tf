resource "aws_vpc" "vpc" {
  cidr_block           = var.vpc_cidr_block
  instance_tenancy     = "default"
  enable_dns_support   = true

  tags = {
    Name = "${var.project_name}-vpc"
  }
}

resource "aws_internet_gateway" "internet_gw" {
  vpc_id                      = aws_vpc.vpc.id

  tags = {
    Name                      = "${var.project_name}-igw"
  }
}

data "aws_availability_zones" "available_zones" {}


resource "aws_subnet" "public_subnet_az1" {
  vpc_id                      = aws_vpc.vpc.id
  cidr_block                  = var.public_subnet_az1_cidr_block
  availability_zone           = data.aws_availability_zones.available_zones.names[0]
  map_public_ip_on_launch     = true

  tags = {
   Name = "${var.project_name}-public-subnet-az1"
  }
}

resource "aws_subnet" "public_subnet_az2" {
  vpc_id                      = aws_vpc.vpc.id
  cidr_block                  = var.public_subnet_az2_cidr_block
  availability_zone           = data.aws_availability_zones.available_zones.names[1]
  map_public_ip_on_launch     = true

  tags = {
   Name = "${var.project_name}-public-subnet-az2"
  }
}

resource "aws_subnet" "private_subnet_az1" {
  vpc_id                      = aws_vpc.vpc.id
  cidr_block                  = var.private_subnet_az1_cidr_block
  availability_zone           = data.aws_availability_zones.available_zones.names[0]
  map_public_ip_on_launch     = false

  tags = {
   Name = "${var.project_name}-private-subnet-az1"
  }
}


resource "aws_subnet" "private_subnet_az2" {
  vpc_id                      = aws_vpc.vpc.id
  cidr_block                  = var.private_subnet_az2_cidr_block
  availability_zone           = data.aws_availability_zones.available_zones.names[1]
  map_public_ip_on_launch     = false

  tags = {
   Name = "${var.project_name}-private-subnet-az1"
  }
}


resource "aws_route_table" "public_route_table" {
  vpc_id                      = aws_vpc.vpc.id

  route {
    cidr_block                = "0.0.0.0/0" 
    gateway_id                = aws_internet_gateway.internet_gw.id
  }

  tags = {
    Name                      = "public route table"
  }
}


resource "aws_route_table_association" "public_subnet_az1_route_table_association" {
  subnet_id                   = aws_subnet.public_subnet_az1.id
  route_table_id              = aws_route_table.public_route_table.id
}