terraform {
  required_version = ">= 1.1.8"
}

module "dynamodb_table" {
  source  = "terraform-aws-modules/dynamodb-table/aws"
  version = "2.0.0"

  create_table = var.create_table

  name       = var.table_name
  hash_key   = var.partition_key
  attributes = var.attributes

  tags = var.tags
}
