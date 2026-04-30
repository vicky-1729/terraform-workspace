terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.42.0"
    }
  }
  backend "s3" {
    bucket = "vs-terraform-statefile"
    key    = "terraform-workspace"
    use_lockfile = true  #S3 native locking
    region = "us-east-1"
    encrypt = true 
  }
}

provider "aws" {
  # Configuration options
  region = "us-east-1"
}


