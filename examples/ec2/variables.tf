# -----------------------------------------
# Optional inputs
# -----------------------------------------
variable "region" {
  description = "AWS region"
  type        = string
  default     = "us-west-2"
}

variable "app_name" {
  description = "Application name"
  type        = string
  default     = "test-ec2"
}

variable "env" {
  description = "One of 'prd', 'stg', or 'dev'"
  type        = string
  default     = "dev"
}

variable "owner" {
  description = "Owner name"
  type        = string
  default     = "lb"
}

variable "team" {
  description = "Team name"
  type        = string
  default     = "casab"
}

variable "instance_count" {
  description = "EC2 instance count"
  type        = number
  default     = 1
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t2.micro"
}

variable "create_key_pair" {
  description = "Boolean to enable key pair creation."
  type        = bool
  default     = true
}

variable "public_key_file" {
  description = "Name of file containing content for aws_key_pair creation"
  type        = string
  default     = "~/.ssh/terraform.pub"
}

variable "enable_local_access" {
  description = "Allow ec2 access from the terraform environment public ip."
  type        = bool
  default     = true
}
