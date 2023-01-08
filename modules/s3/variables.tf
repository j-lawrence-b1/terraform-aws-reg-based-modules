# -------------------------------
# Required inputs.
# -------------------------------
variable "bucket_name" {
  description = "S3 bucket name"
}

variable "tags" {
  description = "Tags"
  type        = map(string)
}

# ---------------------------------------------------------------------------------------
# Optional inputs. See:
#   https://github.com/terraform-aws-modules/terraform-aws-s3-bucket/blob/master/main.tf
# for an example implementation.
# ---------------------------------------------------------------------------------------
variable "enable_bucket" {
  description = "Boolean whether to create the bucket"
  type        = bool
  default     = true
}

variable "acl" {
  description = "Canned bucket ACL. Set to log-delivery-write for logging buckets. Set to null if using grants or access_policy"
  type        = string
  default     = "private"
}

variable "access_grant_rules" {
  description = "S3 bucket access grants. Conflicts with acl"
  type        = list(map(string))
  default     = []
}

variable "enable_access_policy" {
  description = "Set true to enable attaching an iam bucket policy"
  type        = bool
  default     = false
}

variable "access_policy_document" {
  description = "S3 bucket IAM policy, as a valid JSON document"
  type        = string
  default     = null
}

variable "cors_rules" {
  description = "Cross-Origin Resource Sharing (CORS) rules"
  type        = list(map(string))
  default     = []
}

variable "enable_versioning" {
  description = "Set true to enable versioning"
  type        = bool
  default     = true
}

variable "enable_logging" {
  description = "Boolean whether to enable s3 logging."
  type        = bool
  default     = false
}

variable "log_bucket_name" {
  description = "Custom bucket name for logging. Defaults to <bucket_name>-logs"
  type        = string
  default     = null
}

variable "enable_server_side_encryption" {
  description = "Boolean whether to enable AES256 server side encription."
  type        = bool
  default     = true
}

variable "enable_public_access" {
  description = "If false, forbid all public access via user policy or object acls."
  type        = bool
  default     = false
}

variable "enable_lifecycle" {
  description = "Boolean whether to enable a lifecycle rule for old versions and incomplete multipart uploads."
  type        = bool
  default     = false
}

variable "lifecycle_expiration_days" {
  description = "Number of days before expiring s3 bucket objects. Must be nonzero if enable_lifecycle = true"
  type        = number
  default     = null
}

variable "log_enable_lifecycle" {
  description = "Boolean whether to enable a basic version and multipart lifecycle rule on the logging bucket."
  type        = bool
  default     = false
}

variable "log_lifecycle_expiration_days" {
  description = "Number of days before expiring s3 log bucket objects."
  type        = number
  default     = null
}
