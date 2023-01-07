# ----------------------------------
# Optional Inputs
# ---------------------------------
variable "region" {
  description = "AWS region"
  type        = string
  default     = "us-west-2"
}

variable "app_name" {
  description = "Application name"
  type        = string
  default     = "test-s3"
}

variable "env" {
  description = "Environment"
  type        = string
  default     = "dev"
}

variable "owner" {
  description = "Owner"
  type        = string
  default     = "lb"
}

variable "team" {
  description = "Team"
  type        = string
  default     = "casab"
}
