output "dynamodb_table_id" {
  description = "DynamoDB Table ID"
  value       = module.dynamodb_table.dynamodb_table_id
}

output "dynamodb_table_arn" {
  description = "DynamoDB Table ARN"
  value       = module.dynamodb_table.dynamodb_table_arn
}
