# outputs.tf

output "vpc_id" {
  value = module.vpc.vpc_id
}

output "cloudfront_distribution_id" {
  value = module.cloudfront.distribution_id
}

output "amplify_app_id" {
  value = module.amplify.app_id
}

output "domain_amplify" {
  value = module.amplify.default_domain
}

output "s3_bucket_name" {
  value = module.cloudfront.bucket_name
}

output "s3_bucket_domain_name" {
  value = module.cloudfront.bucket_domain_name
}
