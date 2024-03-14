resource "aws_vpc" "vpc" {
  cidr_block           = var.cidr_block
  enable_dns_support   = true

  tags = {
    Name = "My VPC"
  }
}



resource "aws_subnet" "public" {
  count               = var.num_availability_zones
  vpc_id              = aws_vpc.vpc.id
  cidr_block          = cidrsubnet(var.cidr_block, 8, count.index + 1)
  availability_zone   = var.availability_zones[count.index]

  tags = {
    Name = format("Public Subnet %d", count.index + 1)
  }
}

resource "aws_subnet" "private" {
  count               = var.num_availability_zones
  vpc_id              = aws_vpc.vpc.id
  cidr_block          = cidrsubnet(var.cidr_block, 8, count.index + 3)
  availability_zone   = var.availability_zones[count.index]

  tags = {
    Name = format("Private Subnet %d", count.index +1)
  }
}