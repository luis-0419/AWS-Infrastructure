terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

terraform {
  backend "local" {
  }
}

module "ec2_intances" {
  source              = "./modules/ec2_intances"
  name                = var.intances_name
  numbers_instances   = var.numbers_instances
  environment_name    = var.environment_name
  virtualization_type = var.virtualization_type
  root_device_name    = var.root_device_name
  imds_support        = var.imds_support
}

module "vpc" {
  source = "./modules/vpc"
  name   = vpc_name 
}


module "eks" {
  source = "./modules/eks"
}