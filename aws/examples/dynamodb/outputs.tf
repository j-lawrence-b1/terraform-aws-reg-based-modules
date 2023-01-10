output "dynamodb_table_id" {
  description = "Dynamodb table id"
  value       = module.table.dynamodb_table_id
}

output "dynamodb_table_arn" {
  description = "DynamoDB Table ARN"
  value       = module.table.dynamodb_table_arn
}
