terraform {
  required_version = ">= 1.5.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  backend "s3" {
    bucket         = "multicloud-iac-terraform-state-af-south-1"
    key            = "dev/vpc/terraform.tfstate"
    region         = "af-south-1"
    dynamodb_table = "multicloud-iac-state-locks"
    encrypt        = true
  }
}

provider "aws" {
  region = var.aws_region
}

module "development_network" {
  source = "../../modules/aws-vpc"

  environment         = var.environment
  vpc_cidr            = var.vpc_cidr
  public_subnet_cidr  = var.public_subnet_cidr
  private_subnet_cidr = var.private_subnet_cidr
  availability_zone   = var.availability_zone
}