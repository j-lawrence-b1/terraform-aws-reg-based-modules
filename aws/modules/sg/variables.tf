# --------------------------------
# Required inputs
# --------------------------------
variable "vpc_id" {
  description = "VPC id"
  type        = string
}

variable "tags" {
  description = "Default tags"
  type        = map(string)
}

# --------------------------------
# Optional inputs.
# --------------------------------
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

variable "include_my_ip" {
  description = "If true, include the terraform environment public ip as a source to all ingress rules."
  type        = bool
  default     = false
}

variable "ingress_rules" {
  description = "List of pre-fabricated terraform-aws security_group ingress rules"
  type        = list(string)
  default     = ["http-80-tcp", "ssh-tcp"] # Good for test projects only.
}

variable "ingress_cidr_blocks" {
  description = "List of ingress CIDRs. Will be joined to IP of the TF execution env."
  type        = list(string)
  default     = []
}

variable "custom_ingress_rules" {
  description = "List of custom port, protocol, description, cider_block ingress rules"
  type = list(object(
    {
      port        = string
      protocol    = string
      cidr_blocks = list(string)
      description = string
    })
  )
  default = []
}
