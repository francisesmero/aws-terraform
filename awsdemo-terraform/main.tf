module "vpc" {
    source                                = "../modules/vpc"
    availability_zones                    = var.availability_zones
    region                                = var.region
    project_name                          = var.project_name
    vpc_cidr_block                        = var.vpc_cidr_block
    public_subnet_az1_cidr_block          = var.public_subnet_az1_cidr_block
    public_subnet_az2_cidr_block          = var.public_subnet_az2_cidr_block
    private_subnet_az1_cidr_block         = var.private_subnet_az1_cidr_block
    private_subnet_az2_cidr_block         = var.private_subnet_az2_cidr_block
}

module "security_group" {
    source                                = "../modules/security-groups"
    vpc_id                                = module.vpc.vpc_id
}