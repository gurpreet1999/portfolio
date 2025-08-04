terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "6.6.0"
    }
  }
}

provider "aws" {
  region = "ap-south-1"
}

module "vpc" {
  source = "./modules/vpc"
}

module "security_group" {
  source = "./modules/sg"
  vpc_id = module.vpc.vpc_id   
}

module "ec2" {
  source            = "./modules/ec2"
  subnet_id         = module.vpc.subnet_id      
  security_group_id = module.security_group.webserversg_id 
}
