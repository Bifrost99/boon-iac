terraform {
  backend "s3" {
    bucket  = "boon-tfstate"
    key     = "state/terraform.tfstate"
    region  = "eu-central-1"
    encrypt = true
  }
}

provider "aws" {
  region  = "eu-central-1"
  profile = "boon"
}