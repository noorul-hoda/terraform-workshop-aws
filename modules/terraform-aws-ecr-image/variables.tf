variable "dockerfile_dir" {
  type        = string
  description = "The directory that contains the Dockerfile"
}

variable "ecr_repository_url" {
  type        = string
  description = "Full url for the ECR repository"
}

variable "docker_image_tag" {
  type        = string
  description = "This is the tag which will be used for the image that you created"
  default     = "latest"
}

variable "region" {
  type        = string
  description = "AWS region"  
}

variable "profile" {
  type        = string
  description = "Aws cli profile"
}

variable "account_id" {
  type        = string
  description = "AWS accountID for the the command in ECR - URI"
}