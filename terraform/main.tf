
/*terraform {
  backend "s3" {
    bucket = "only-class-purpose"
    key = "aws-test-terraform/terraform.tfstate"
    region = "us-east-1"
  }
}*/

provider "aws" {
  region = var.region
}

#===========================
# VPC y redes
#===========================

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.1.1"

  name = var.project_name
  cidr = var.vpc_cidr

  azs             = var.vpc_azs
  public_subnets  = var.vpc_public_subnets
  private_subnets = var.vpc_private_subnets

  enable_nat_gateway    = var.vpc_enable_nat_gateway
  single_nat_gateway    = true
  enable_dns_support    = true
  enable_dns_hostnames  = true
  tags = var.tags
}
