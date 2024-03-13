variable "cidr_block" {
  # The CIDR block for the VPC
  type = string
  default = "10.0.0.0/16"
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