output "s3_bucket_id" {
  description = "S3 bucket id"
  value       = module.s3_basic.s3_bucket_id
}

output "logging_bucket_id" {
  description = "Logging bucket id"
  value       = module.s3_basic.s3_log_bucket_id
}
