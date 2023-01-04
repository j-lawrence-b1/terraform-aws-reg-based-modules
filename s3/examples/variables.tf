variable "region" {
  description = "AWS region"
  type        = string
  default     = "us-west-2"
}

variable "team" {
  description = "Team"
  type        = string
  default     = "lb"
}

variable "env" {
  description = "Environment"
  type        = string
  default     = "dev"
}

variable "app" {
  description = "Application name"
  type        = string
}
