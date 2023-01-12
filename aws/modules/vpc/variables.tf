# ------------------------------
# Required inputs
# ------------------------------
variable "vpc_name" {
  description = "Name of the VPC"
  type        = string
}

variable "tags" {
  description = "Default tags"
  type        = map(string)
}

# ------------------------------
# Optional inputs
# ------------------------------
variable "enable_vpc" {
  description = "Boolean to enable vpc creation"
  type        = string
  default     = "true"
}

variable "vpc_cidr" {
  description = "VPC CIDR block"
  type        = string
  default     = "10.0.0.0/24" # 251 usable ips, from 10.0.0.0 to 10.0.0.255.
}

variable "public_subnets" {
  description = "List of public subnet CIDR blocks"
  type        = list(string)
  default     = ["10.0.0.0/27", "10.0.0.32/27"] # 28 usable ips each. Good enough for testing.
}

variable "private_subnets" {
  description = "List of private subnet CIDR blocks"
  type        = list(string)
  default     = [] # Use ["10.0.0.64/27", "10.0.0.96/27"] if you want private subnets.
}

variable "database_subnets" {
  description = "List of database subnet CIDR blocks"
  type        = list(string)
  default     = [] # Use ["10.0.0.128/27", "10.0.0.160/27"] if you want database subnets.
}

variable "nat_eip_ids" {
  description = "List of NAT EIP IDs if created elsewhere."
  type        = list(string)
  default     = []
}

variable "enable_database_public_access" {
  description = "Boolean whether to enable internet access to the persistence subnets (not recommended for production)."
  type        = bool
  default     = false
}
