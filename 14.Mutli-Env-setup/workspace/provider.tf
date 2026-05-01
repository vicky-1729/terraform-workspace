#============================================================
# Provider with S3 Backend for Workspace Approach
# Single S3 bucket - Terraform creates separate state per workspace
# State path: terraform-workspace/env:/<workspace_name>
#============================================================

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.42.0"
    }
  }
  backend "s3" {
    bucket       = "vs-terraform-statefile"    # Same bucket for all workspaces
    key          = "terraform-workspace"       # Base key - workspace adds prefix
    use_lockfile = true   # S3 native locking
    region       = "us-east-1"
    encrypt      = true 
  }
}

provider "aws" {
  region = "us-east-1"
}


