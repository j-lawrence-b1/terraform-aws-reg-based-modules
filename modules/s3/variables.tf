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
variable "create_bucket" {
  description = "Boolean to create the bucket"
  type        = bool
  default     = true
}

variable "acl" {
  description = "Canned bucket ACLs. Set to 'log-delivery-write' for lb logging buckets. Conflicts with grant."
  type        = string
  default     = null
}

variable "grant" {
  description = "S3 bucket grants. Conflicts with acl."
  type        = list(map(string))
  default     = []
}

variable "enable_policy" {
  description = "Set true to enable attaching an iam bucket policy"
  type        = bool
  default     = false
}

variable "policy" {
  description = "S3 bucket IAM policy, as a valid JSON document"
  type        = string
  default     = null
}

variable "cors_rule" {
  description = "Cross-Origin Resource Sharing (CORS) rule."
  type        = list(map(string))
  default     = []
}

variable "enable_versioning" {
  description = "Set true to enable versioning"
  type        = bool
  default     = true
}

variable "logging" {
  description = "Logging configuration."
  type        = map(string)
  default     = {}
}

variable "server_side_encryption_configuration" {
  description = "Server side encription configuration block"
  type        = any
  default     = {
    rule = {
      apply_server_side_encryption_by_default = {
        sse_algorithm = "AES256"
      }
    }
  }
}

variable "block_public_acls" {
  description = "Set true to block creation of public acls"
  type        = bool
  default     = true
}

variable "block_public_policy" {
  description = "Set true to block creation of policies that allow public access"
  type        = bool
  default     = true
}

variable "ignore_public_acls" {
  description = "Set true to ignore existing public acls"
  type        = bool
  default     = true
}

variable "restrict_public_buckets" {
  description = "Set true to restrict public bucket policies"
  type        = bool
  default     = true
}

variable "attach_elb_log_delivery_policy" {
  description = "Set to true for for ELB logging buckets"
  type        = bool
  default     = false
}

variable "attach_lb_log_delivery_policy" {
  description = "Set to true for for ALB/NLB logging buckets"
  type        = bool
  default     = false
}
