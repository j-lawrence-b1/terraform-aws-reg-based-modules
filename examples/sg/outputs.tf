output "vpc_id" {
  description = "VPC id"
  value       = module.public_vpc.vpc_id
}

output "security_group_id" {
  description = "EC2 security group id"
  value       = module.sg.security_group_id
}
