#============================================================
# Provider Configuration
# This tells Terraform WHICH cloud provider to use and its version
# terraform init --> downloads the provider plugin
#============================================================

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"   # Provider source: registry.terraform.io/hashicorp/aws
      version = "6.42.0"          # Pin version to avoid breaking changes
    }
  }
}

provider "aws" {
  region = "us-east-1"  # AWS Region where resources will be created
}


