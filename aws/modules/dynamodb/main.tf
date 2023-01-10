module "dynamodb_table" {
  source  = "terraform-aws-modules/dynamodb-table/aws"
  version = "~> 3.1"

  create_table                   = var.enable_create_table
  server_side_encryption_enabled = var.enable_encryption
  stream_enabled                 = var.enable_streams

  name                     = var.table_name
  hash_key                 = var.partition_key
  range_key                = var.sort_key
  global_secondary_indexes = var.secondary_indexes
  attributes               = var.attributes

  billing_mode   = var.billing_mode   # Default: "PAY_FOR_REQUEST"
  read_capacity  = var.read_capacity  # Default: null
  write_capacity = var.write_capacity # Default: null

  tags = var.tags
}
