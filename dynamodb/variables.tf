# -------------------------------
# Required inputs.
# -------------------------------
variable "table_name" {
  description = "Dynamodb table name"
}

variable "partition_key" {
  description = "Name of key to use for the hash (partition) key. Must be in attributes list"
  type        = string
}

variable "attributes" {
  description = "List of name, type maps for table partition and sort keys."
  type        = list(map(string))
}

variable "tags" {
  description = "Tags"
  type        = map(string)
}

# -------------------------------
# Optional inputs.
# -------------------------------
variable "create_table" {
  description = "Boolean whether to create a table."
  type        = bool
  default     = true
}
