#============================================================
# Provider Configuration (Local State)
# No backend block = state stored locally as terraform.tfstate
#============================================================

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.42.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}


