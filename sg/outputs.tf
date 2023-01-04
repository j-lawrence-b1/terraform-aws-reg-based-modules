output "security_group_id" {
  description = "Security group id"
  value = module.sg.security_group_id
}

output "security_group_name" {
  description = "Security group name"
  value = module.sg.security_group_name
}
