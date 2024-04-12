terraform {
  backend "s3" {
    bucket  = "terraform-state-bucket"
    key     = "state/terraform.tfstate"
    region  = "us-east-1"
    encrypt = true
  }
}

provider "aws" {
  region  = "eu-central-1"
  profile = "boon"
}
