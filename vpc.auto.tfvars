vpc_settings = {
  name                 = "boon-vpc"
  cidr                 = "10.0.0.0/16"
  azs                  = ["eu-central-1a", "eu-central-1b", "eu-central-1c"]
  database_subnets     = ["10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24"]
  private_subnets      = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  public_subnets       = ["10.0.201.0/24", "10.0.202.0/24", "10.0.203.0/24"]
  enable_nat_gateway   = "true"
  single_nat_gateway   = "true"
  enable_dns_hostnames = "true"
  enable_dns_support   = "true"
}






