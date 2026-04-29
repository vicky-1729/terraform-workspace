terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.42.0"
    }
  }
  backend "s3" {
    # aws azure
    bucket = "vs-terraform-statefile"
    key    = "vs-terraform-s3"
    # dynamodb_table = "vs-terraform-file" # state locking--> depricated
    use_lockfile = true  #S3 native locking
    region = "us-east-1"
    encrypt = true 
  }
}

provider "aws" {
  # Configuration options
  region = "us-east-1"
}


