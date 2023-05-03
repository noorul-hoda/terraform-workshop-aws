 output "s3_bucket_id" {
  value = module.s3_bucket.s3_bucket_id
}

output "dynamodb_table_id" {
  value = module.dynamodb_table.dynamodb_table_id
}

output "repository_url" {
  value = module.ecr.repository_url
}

output "repository_arn" {
  value = module.ecr.repository_arn
}

output "ecr_image_url" {
  value = module.ecr_image.ecr_image_url
}

output "route53_zone_name_servers" {
  value = module.zones.route53_zone_name_servers
}
