terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.42.0"
    }
  }
  backend "s3" {
  # based on my env
  }
}

provider "aws" {
  # Configuration options
  region = "us-east-1"
}


