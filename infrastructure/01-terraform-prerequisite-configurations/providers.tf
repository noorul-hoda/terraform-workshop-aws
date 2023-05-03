terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "4.62.0"
    }
  }
}

provider "aws" {
  # Configuration options
  region = "eu-west-2"
  profile = "aws-access-key-profile-name"
}