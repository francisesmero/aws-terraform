resource "aws_vpc" "vpc" {
  cidr_block           = var.vpc_cidr_block
  instance_tenancy     = "default"
  enable_dns_support   = true

  tags = {
    Name = "${var.project_name}-vpc"
  }
}

resource "aws_internet_gateway" "my_internet_gw" {
  vpc_id                      = aws_vpc.vpc.id

  tags = {
    Name                      = "${var.project_name}-igw"
  }
}

data "availability_zones" "available_zones" {}


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
  map_public_ip_on_launch     = true

  tags = {
   Name = "${var.project_name}-public-subnet-az1"
  }
}


resource "aws_subnet" "private_subnet_az2" {
  vpc_id                      = aws_vpc.vpc.id
  cidr_block                  = var.private_subnet_az2_cidr_block
  availability_zone           = data.aws_availability_zones.available_zones.names[1]
  map_public_ip_on_launch     = true

  tags = {
   Name = "${var.project_name}-public-subnet-az1"
  }
}



