module "ssh_security_group" {
  source  = "terraform-aws-modules/security-group/aws//modules/ssh"
  version = "~> 5.0"
  name    = "ssh-sg"
  vpc_id  = module.vpc.vpc_id

  ingress_cidr_blocks = ["0.0.0.0/0"]
}

module "rds_security_group" {
  source  = "terraform-aws-modules/security-group/aws//modules/postgresql"
  version = "~> 5.0"
  name    = "rds-sg"
  vpc_id  = module.vpc.vpc_id

  ingress_cidr_blocks = [module.vpc.vpc_cidr_block]
}

module "kubernetes_api_security_group" {
  source  = "terraform-aws-modules/security-group/aws//modules/kubernetes-api"
  version = "~> 5.0"
  name    = "kubernetes-api-sg"
  vpc_id  = module.vpc.vpc_id

  ingress_cidr_blocks = [module.vpc.vpc_cidr_block, "37.252.91.194/32"]
}

