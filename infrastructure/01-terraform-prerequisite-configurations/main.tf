provider "aws" {
  region = "eu-west-2"
  profile = "aws-access-key-profile-name"
}

#######################
#s3-backend
#######################
## Label for S3 bucket for backend
module "s3-label" {
  source = "../../modules/terraform-null-label"

  namespace   = var.project
  environment = var.environment
  name        = "backend-tfstate"

  label_order = ["namespace", "name", "environment"]

  additional_tag_map = {
    ManagedBy = "Terraform"
  }
}

## S3 bucket for backend
module "s3_bucket" {
  source = "../../modules/terraform-aws-s3"

  bucket                                = module.s3-label.id
  acl                                   = "private"
  attach_deny_insecure_transport_policy = true
  block_public_acls                     = true
  block_public_policy                   = true
  ignore_public_acls                    = true
  restrict_public_buckets               = true

  versioning = {
    enabled = true
  }

}


#######################
#dynamoddb-table
#######################
## Label for dynamodb table for backend
module "dynamodb-label" {
  source = "../../modules/terraform-null-label"

  namespace   = var.project
  environment = var.environment
  name        = "tfstate-lock"

  label_order = ["namespace", "name", "environment"]

  additional_tag_map = {
    ManagedBy = "Terraform"
  }
}

## dynamodb table for backend
module "dynamodb_table" {
  source = "../../modules/terraform-aws-dynamodb-table"

  name     = module.dynamodb-label.id
  hash_key = "LockID"

  attributes = [
    {
      name = "LockID"
      type = "S"
    }
  ]
}

###############################
#ECR - sample-hello-world
###############################
## Sample hello world ECR repository
module "ecr" {
  source = "../../modules/terraform-aws-ecr"

  name                    = "sample-hello-world"
  scan_images_on_push     = false
  enable_lifecycle_policy = true
  max_image_count         = "1"
  image_tag_mutability    = "MUTABLE"

  tags = {
    Project     = var.project
    Environment = var.environment
  }
}

###############################
#hello-world image to ecr
###############################
## Data source to get current account id
data "aws_caller_identity" "current" {}

## Sample hello world image to ECR
module "ecr_image" {
  source             = "../../modules/terraform-aws-ecr-image"
  dockerfile_dir     = "./"
  ecr_repository_url = module.ecr.repository_url
  region             = var.region
  profile            = var.profile
  account_id         = data.aws_caller_identity.current.account_id
}

###############################
#Route53 zones records
###############################

module "zones" {
  source = "../../modules/terraform-aws-route53/zones"

  zones = {
    "main-domain" = {
      domain_name = "${var.domain_name}"
    }
  }
}