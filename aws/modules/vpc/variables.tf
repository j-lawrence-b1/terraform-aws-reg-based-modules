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
  default     = "10.0.0.0/20" # 4096 IPs from 10.0.0.0 to 10.0.15.255.
}

variable "public_subnets" {
  description = "List of public subnet CIDR blocks"
  type        = list(string)
  default     = ["10.0.0.0/24", "10.0.1.0/24"]
}

variable "private_subnets" {
  description = "List of private subnet CIDR blocks"
  type        = list(string)
  default     = [] # Use ["10.0.2.0/24", "10.0.3.0/24"] if you want private subnets.
}

variable "database_subnets" {
  description = "List of database subnet CIDR blocks"
  type        = list(string)
  default     = [] # Use ["10.0.4.0/24", "10.0.5.0/24"] if you want database subnets.
}

variable "nat_eip_ids" {
  description = "List of NAT EIP IDs if created elsewhere."
  type        = list(string)
  default     = []
}
