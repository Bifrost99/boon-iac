variable "vpc_name" {
  description = "Name of the VPC"
  default     = "boon-vpc"
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  default     = "10.0.0.0/16"
}

variable "vpc_azs" {
  description = "Availability zones"
  type        = list(string)
  default     = ["us-east-1a", "us-east-1b", "us-east-1c"]
}

variable "vpc_database_subnets" {
  description = "CIDR blocks for the database subnets"
  type        = list(string)
  default     = ["10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24"]
}


variable "vpc_private_subnets" {
  description = "CIDR blocks for the private subnets"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
}

variable "vpc_public_subnets" {
  description = "CIDR blocks for the public subnets"
  type        = list(string)
  default     = ["10.0.201.0/24", "10.0.202.0/24", "10.0.203.0/24"]
}

variable "vpc_enable_nat_gateway" {
  type        = bool
  description = "Flag to enable NAT gateway"
  default     = true
}

variable "vpc_single_nat_gateway" {
  type        = bool
  description = "Flag to use a single NAT gateway for all subnets"
  default     = true
}

variable "vpc_enable_dns_hostnames" {
  type        = bool
  description = "Flag to use dns hostname"
  default     = true
}

variable "vpc_enable_dns_support" {
  type        = bool
  description = "Flag to use dns support"
  default     = true
}