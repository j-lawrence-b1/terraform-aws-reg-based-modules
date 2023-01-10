output "s3_bucket_id" {
  description = "S3 bucket ID"
  value       = module.s3_bucket.s3_bucket_id
}

output "s3_log_bucket_id" {
  description = "S3 bucket ID"
  value       = module.s3_log_bucket.s3_bucket_id
}
