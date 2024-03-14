module "vpc" {
  source = "./modules/vpc"
  cidr_block = "10.0.0.0/16"
  num_availability_zones = 2
  availability_zones = ["ap-southeast-1a", "ap-southeast-1b"]
}