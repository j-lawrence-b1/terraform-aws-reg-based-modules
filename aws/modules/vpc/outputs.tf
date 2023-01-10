output "vpc_id" {
  description = "VPC id"
  value       = module.vpc.vpc_id
}

output "name" {
  description = "VPC name"
  value       = module.vpc.name
}

output "public_subnets" {
  description = "Public subnet ids"
  value       = module.vpc.public_subnets
}

output "public_subnets_cidr_blocks" {
  description = "Public subnet cidr blocks"
  value       = module.vpc.public_subnets_cidr_blocks
}

output "private_subnets" {
  description = "Private subnet ids"
  value       = module.vpc.private_subnets
}

output "private_subnets_cidr_blocks" {
  description = "Public subnet cidr blocks"
  value       = module.vpc.private_subnets_cidr_blocks
}

output "database_subnets" {
  description = "Database subnet ids"
  value       = module.vpc.database_subnets
}

output "database_subnets_cidr_blocks" {
  description = "Database subnet cidr blocks"
  value       = module.vpc.database_subnets_cidr_blocks
}
