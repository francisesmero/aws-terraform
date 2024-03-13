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
  cidr_block           = cidrsubnet(aws_vpc.vpc.cidr_block, 8, count.index)
  availability_zone   = var.availability_zones[count.index]

  tags = {
    Name = format("Public Subnet %d", count.index + 1)
  }
}