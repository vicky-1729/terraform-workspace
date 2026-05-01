#============================================================
# 12. Remote Backend - S3
# Topic: Store state file in S3 instead of local disk
# Why Remote State?
#   1. Team collaboration - everyone reads same state
#   2. Security - state not on local machine
#   3. Locking - prevents concurrent modifications
# Command: terraform init -reconfigure (to switch backends)
#============================================================

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.42.0"
    }
  }
  #----------------------------------------------------------
  # OPTION 1: OLD Way - DynamoDB Locking (DEPRECATED)
  # DynamoDB table was used to prevent concurrent state modifications
  # You had to create a DynamoDB table separately with LockID as partition key
  #----------------------------------------------------------
  # backend "s3" {
  #   bucket         = "vs-terraform-statefile"
  #   key            = "vs-terraform-s3"
  #   dynamodb_table = "vs-terraform-file"   # DynamoDB table for state locking (DEPRECATED)
  #   region         = "us-east-1"
  #   encrypt        = true
  # }

  #----------------------------------------------------------
  # OPTION 2: NEW Way - S3 Native Locking (RECOMMENDED)
  # No need to create a separate DynamoDB table!
  # S3 handles locking natively with use_lockfile = true
  #----------------------------------------------------------
  backend "s3" {
    bucket       = "vs-terraform-statefile"   # S3 bucket name (must exist)
    key          = "vs-terraform-s3"          # Path/name of state file in bucket
    use_lockfile = true    # S3 native locking (replaces deprecated DynamoDB)
    region       = "us-east-1"
    encrypt      = true    # Encrypt state file at rest in S3
  }
  
}

provider "aws" {
  region = "us-east-1"
}


