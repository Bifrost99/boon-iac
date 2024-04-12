module "ssh_security_group" {
  source  = "terraform-aws-modules/security-group/aws//modules/ssh"
  version = "~> 5.0"

  ingress_cidr_blocks = var.ssh_cird_block
}

module "rds_security_group" {
  source  = "terraform-aws-modules/security-group/aws//modules/postgresql"
  version = "~> 5.0"

  ingress_cidr_blocks = module.vpc.cidr
}

module "kubernetes_api_security_group" {
  source  = "terraform-aws-modules/security-group/aws//modules/kubernetes-api"
  version = "~> 5.0"

  ingress_cidr_blocks = module.vpc.cidr
}

