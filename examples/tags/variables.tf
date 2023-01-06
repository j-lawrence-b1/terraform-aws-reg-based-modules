# -----------------------------------------
# Required inputs
# -----------------------------------------
variable "region" {
  description = "AWS region"
  type        = string
  default     = "us-west-2"
}

variable "app_name" {
  description = "Application name"
  type        = string
  default     = "test-tags"
}

variable "env" {
  description = "One of 'prd', 'stg', or 'dev'"
  type        = string
  default     = "dev"
}

variable "team" {
  description = "Team name"
  type        = string
  default     = "casab"
}

variable "owner" {
  description = "Owner"
  type        = string
  default     = "lb"
}
