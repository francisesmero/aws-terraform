module "vpc" {
  source                      = "./modules/vpc"
  cidr_block                  = "10.0.0.0/16"
  num_availability_zones      = 2
  availability_zones          = ["ap-southeast-1a", "ap-southeast-1b"]
}

module "aws_security_group" {
  source                      = "./modules/security-groups"
  vpc_id                      = module.vpc.vpc_id 
}


  # port_number                 = ["22","3306", "443"]
  # protocol_type               = ["tcp"]
  # cidr_source                 = var.allow_internet_access ? ["0.0.0.0/0"] : [aws_vpc.main.cidr_block]


# module "object-storage" {
#   source = "./modules/object-storage"
# }

# module "database" {
#   source = "./modules/database"
# }

# module "web-server-cluster" {
#   source = "./modules/web-server-cluster"
# }