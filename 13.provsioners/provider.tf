#============================================================
# Provider with S3 Backend for Provisioners Demo
#============================================================

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.42.0"
    }
  }
  backend "s3" {
    bucket       = "vs-terraform-statefile"
    key          = "vs-terraform-pro"
    use_lockfile = true   # S3 native locking
    region       = "us-east-1"
    encrypt      = true 
  }
}

provider "aws" {
  region = "us-east-1"
}


