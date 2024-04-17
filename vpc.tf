variable "vpc_settings" {
  default     = {}
  description = "Necessary setting for VPC provider"
}


module "vpc" {
  source               = "terraform-aws-modules/vpc/aws"
  name                 = var.vpc_settings["name"]
  cidr                 = var.vpc_settings["cidr"]
  azs                  = var.vpc_settings["azs"]
  database_subnets     = var.vpc_settings["database_subnets"]
  private_subnets      = var.vpc_settings["private_subnets"]
  public_subnets       = var.vpc_settings["public_subnets"]
  enable_nat_gateway   = var.vpc_settings["enable_nat_gateway"]
  single_nat_gateway   = var.vpc_settings["single_nat_gateway"]
  enable_dns_hostnames = var.vpc_settings["enable_dns_hostnames"]
  enable_dns_support   = var.vpc_settings["enable_dns_support"]

  public_subnet_tags = {
    "kubernetes.io/role/elb" = "1"
  }

  private_subnet_tags = {
    "kubernetes.io/role/internal-elb" = "1"
  }
}
