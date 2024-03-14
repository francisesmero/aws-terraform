variable "cidr_block" {
  # The CIDR block for the VPC
  type = string
}

variable "num_availability_zones" {
  # The number of availability zones to create subnets in
  type = number
  default = 2
}

variable "availability_zones" {
  # Optional list of specific availability zones to use
  # If not set, Terraform will choose default availability zones
  type = list(string)
}


variable "public_subnet_cidr" {
  description         = "Public Subnet CIDR block"
  type                = list(string)
  default             = ["0", "1"]
}

variable "private_subnet_cidr" {
  description         = "Private Subnet CIDR block"
  type                = list(string)
  default             = ["2", "3"]
}