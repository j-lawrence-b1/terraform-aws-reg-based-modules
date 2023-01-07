# -------------------------------
# Required inputs.
# -------------------------------
variable "table_name" {
  description = "Dynamodb table name"
}

variable "partition_key" {
  description = "The attribute to use as the hash (partition) key. Must also be defined as an attribute"
  type        = string
}

variable "attributes" {
  description = "List of name, type maps for table partition and sort keys"
  type        = list(map(string))
}

variable "tags" {
  description = "Tags"
  type        = map(string)
}

# -------------------------------
# Optional inputs.
# -------------------------------
variable "enable_create_table" {
  description = "Whether or not to create a table"
  type        = bool
  default     = true
}

variable "enable_encryption" {
  description = "Whether or not to enable KMS encryption at rest using an AWS managed KMS customer master key (CMK)"
  type        = bool
  default     = true
}

variable "enable_streams" {
  description = "Whether or not to enable DynamoDB Streams on this table."
  type        = bool
  default     = false
}

variable "sort_key" {
  description = "The attribute to use as a range (sort) key. Must also be defined as an attribute"
  type        = string
  default     = null
}

variable "secondary_indexes" {
  description = "Global secondary indexes. Subject to number of GSIs, projected attributes, etc. limits"
  type        = list(string)
  default     = []
}

variable "billing_mode" {
  description = "Controls how you are billed for read/write throughput"
  type        = string
  default     = "PAY_PER_REQUEST"
}

variable "read_capacity" {
  description = "The number of read units for this table. Set > 0 if billing_mode = PROVISIONED"
  type        = number
  default     = null
}

variable "write_capacity" {
  description = "The number of write units for this table. Set > 0 if billing_mode = PROVISIONED"
  type        = number
  default     = null
}
