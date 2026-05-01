#============================================================
# Provider with Dynamic Backend
# backend "s3" {} is empty - values come from backend.tf files
# terraform init -backend-config=dev/backend.tf  --> dev state
# terraform init -backend-config=prod/backend.tf --> prod state
#============================================================

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.42.0"
    }
  }
  backend "s3" {
    # Empty! Values injected via -backend-config flag
  }
}

provider "aws" {
  region = "us-east-1"
}


