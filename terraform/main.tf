# Terraform template para arquitectura en AWS con buenas prácticas

# Este archivo es una estructura base. Requiere que uses módulos reutilizables
# desde el registro oficial o tus propios módulos. Asegura separación por capas.

provider "aws" {
  region = var.region
}

#===========================
# VPC y redes
#===========================
/*module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.1.1"

  name = var.project_name
  cidr = var.vpc_cidr

  azs             = var.vpc_azs
  public_subnets  = var.vpc_public_subnets
  private_subnets = var.vpc_private_subnets

  enable_nat_gateway = var.vpc_enable_nat_gateway

  tags = var.tags
}*/

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
