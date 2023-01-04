# -----------------------------------------
# Optional inputs
# -----------------------------------------
variable "region" {
  description = "AWS region"
  type        = string
  default     = "us-west-2"
}

variable "app" {
  description = "Application name"
  type        = string
  default     = "test-sg"
}

variable "env" {
  description = "One of 'prd', 'stg', or 'dev'"
  type        = string
  default     = "dev"
}

variable "team" {
  description = "Team name"
  type        = string
  default     = "lb"
}
