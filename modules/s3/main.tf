module "s3_bucket" {
  source  = "terraform-aws-modules/s3-bucket/aws"
  version = "~> 3.6.0"

  bucket = var.bucket_name
  acl    = var.acl
  grant  = var.grant
  versioning = {
    enabled = var.enable_versioning
  }
  attach_policy = var.enable_policy
  policy        = var.policy

  server_side_encryption_configuration = var.server_side_encryption_configuration

  block_public_acls       = var.block_public_acls
  block_public_policy     = var.block_public_policy
  ignore_public_acls      = var.ignore_public_acls
  restrict_public_buckets = var.restrict_public_buckets

  tags = var.tags
}
