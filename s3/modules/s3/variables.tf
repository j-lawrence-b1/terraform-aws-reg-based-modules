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

# -------------------------------
# Optional inputs.
# -------------------------------
variable "create_bucket" {
  description = "Boolean to create the bucket"
  type        = bool
  default     = true
}

variable "acl" {
  description = "S3 bucket ACL. Set to 'log-delivery-write' for lb logging buckets"
  type        = string
  default     = "private"
}

variable "enable_policy" {
  description = "Set true to enable attaching a bucket policy"
  type        = bool
  default     = false
}

variable "policy" {
  description = "S3 bucket policy, as a valid JSON document"
  type        = string
  default     = null
}

variable "enable_versioning" {
  description = "Set true to enable versioning"
  type        = bool
  default     = true
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
