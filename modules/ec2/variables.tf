# -----------------------------
# Required inputs.
# -----------------------------
variable "security_group_ids" {
  description = "EC2 security groups"
  type        = list(string)
}

variable "subnet_id" {
  description = "EC2 subnet id"
  type        = string
}

variable "instance_prefix" {
  description = "Instance name prefix"
  type        = string
}

# -----------------------------
# Optional inputs.
# -----------------------------
variable "tags" {
  description = "Tags"
  type        = map(string)
  default     = {}
}

variable "ami" {
  description = "AWS image id"
  type        = string
  default     = null
}

variable "key_name" {
  description = "Name of existing aws_key_pair resource."
  type        = string
  default     = "terraform"
}

variable "instance_count" {
  description = "EC2 instance count"
  type        = number
  default     = 1
}

variable "instance_type" {
  description = "EC2 Machine type"
  type        = string
  default     = "t2.micro"
}

variable "enable_detailed_monitoring" {
  description = "Enable detailed monitoring"
  type        = bool
  default     = false
}

variable "disable_api_termination" {
  description = "Disable api termination protection"
  type        = bool
  default     = false
}
