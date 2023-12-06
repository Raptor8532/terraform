provider "aws" {
  profile = "labs-terraform-eks"
  region  = "eu-west-3"
}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.21"
    }
  }
}