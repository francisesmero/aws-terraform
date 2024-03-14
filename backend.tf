terraform {
  required_version  = ">= 0.12"
  backend "s3" {
    region          = "ap-southeast-1"
    bucket          = "fesmero-terraform-state"
    key             = "state/terraform.tfstate"
    profile         = "fesmero-terraform"
  }
}
