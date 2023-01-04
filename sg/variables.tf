# --------------------------------
# Required inputs
# --------------------------------
variable "vpc_id" {
  description = "VPC id"
  type        = string
}

# --------------------------------
# Optional inputs.
# --------------------------------
variable "tags" {
  description = "Default tags"
  type        = map(string)
  default     = {}
}

variable "name" {
  description = "Security group name"
  type        = string
  default     = "http-ssh-sg"
}

variable "description" {
  description = "Security group description"
  type        = string
  default     = "SSH, HTTP ingress from anywhere"
}

variable "ingress_rules" {
  description = "List of pre-fabricated terraform-aws/security_group ingress rules"
  type        = list(string)
  default     = ["http-80-tcp", "ssh-tcp"] # Good for test projects only.
}

variable "ingress_cidr_blocks" {
  description = "List of ingress CIDRs"
  type        = list(string)
  default     = ["0.0.0.0/0"] # Good for test projects only
}
