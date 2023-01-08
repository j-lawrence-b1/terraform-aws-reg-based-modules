module "s3_bucket" {
  source  = "terraform-aws-modules/s3-bucket/aws"
  version = "~> 3.6"

  create_bucket = var.enable_bucket
  bucket        = var.bucket_name

  acl           = var.acl
  grant         = var.access_grant_rules
  attach_policy = var.enable_access_policy
  policy        = var.access_policy_document

  cors_rule = var.cors_rules

  block_public_acls       = var.enable_public_access ? false : true
  block_public_policy     = var.enable_public_access ? false : true
  ignore_public_acls      = var.enable_public_access ? false : true
  restrict_public_buckets = var.enable_public_access ? false : true

  attach_deny_insecure_transport_policy = true # Require https access

  tags = var.tags
}

module "s3_log_bucket" {
  source  = "terraform-aws-modules/s3-bucket/aws"
  version = "~> 3.6"

  create_bucket = var.enable_bucket && var.enable_logging
  bucket        = var.log_bucket_name != null ? var.log_bucket_name : "${var.bucket_name}-logs"
  acl           = "log-delivery-write"

  attach_deny_insecure_transport_policy = true # Require https access

  tags = var.tags
}

# -------------------------------------------------------------------------------
# Resources
#
# These resources exist because I wanted to minimize the use of complex input
# variables but dynamic blocks aren't supported inside modules (grrr).
# -------------------------------------------------------------------------------
resource "aws_s3_bucket_logging" "bucket" {
  count = var.enable_bucket && var.enable_logging ? 1 : 0

  bucket = module.s3_bucket.s3_bucket_id

  target_bucket = module.s3_log_bucket.s3_bucket_id
  target_prefix = "logs/"
}

resource "aws_s3_bucket_server_side_encryption_configuration" "bucket" {
  count = var.enable_bucket && var.enable_server_side_encryption ? 1 : 0

  bucket = module.s3_bucket.s3_bucket_id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256" # AWS default encryption scheme only.
    }
  }
}

resource "aws_s3_bucket_versioning" "bucket" {
  count = var.enable_bucket && var.enable_versioning ? 1 : 0

  bucket = module.s3_bucket.s3_bucket_id

  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_lifecycle_configuration" "bucket" {
  count = var.enable_bucket && var.enable_lifecycle ? 1 : 0

  bucket = module.s3_bucket.s3_bucket_id

  rule {
    id     = "config"
    status = "Enabled"

    dynamic "expiration" {
      for_each = toset(var.lifecycle_expiration_days != null ? ["fake"] : [])
      content {
        days = var.lifecycle_expiration_days
      }
    }

    abort_incomplete_multipart_upload {
      days_after_initiation = 3
    }

    dynamic "noncurrent_version_expiration" {
      for_each = toset(var.enable_versioning ? ["fake"] : [])
      content {
        noncurrent_days = 90
      }
    }

    dynamic "noncurrent_version_transition" {
      for_each = toset(var.enable_versioning ? ["fake"] : [])
      content {
        noncurrent_days = 30
        storage_class   = "STANDARD_IA"
      }
    }
  }
}

# ---------------------------------------------------------------------
# Log bucket resources
#
# For the log bucket, we only configure sse and lifecycle.
# ---------------------------------------------------------------------
resource "aws_s3_bucket_server_side_encryption_configuration" "logs" {
  count = var.enable_bucket && var.enable_logging && var.enable_server_side_encryption ? 1 : 0

  bucket = module.s3_log_bucket.s3_bucket_id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256" # AWS default encryption scheme only.
    }
  }
}

resource "aws_s3_bucket_lifecycle_configuration" "logs" {
  count = var.enable_bucket && var.log_enable_lifecycle ? 1 : 0

  bucket = module.s3_bucket.s3_bucket_id

  rule {
    id     = "config"
    status = "Enabled"

    dynamic "expiration" {
      for_each = toset(var.lifecycle_expiration_days != null ? ["fake"] : [])
      content {
        days = var.log_lifecycle_expiration_days
      }
    }

    abort_incomplete_multipart_upload {
      days_after_initiation = 3
    }
  }
}
