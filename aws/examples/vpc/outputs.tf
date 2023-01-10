output "vpc_id" {
  description = "VPC id"
  value       = module.public_vpc.vpc_id
}

output "vpc_name" {
  description = "VPC name"
  value       = module.public_vpc.name
}

output "public_subnet_ids" {
  description = "Public subnet ids"
  value       = module.public_vpc.public_subnets
}

output "private_subnet_ids" {
  description = "Private subnet ids"
  value       = module.public_vpc.private_subnets
}

output "database_subnet_ids" {
  description = "Database subnet ids"
  value       = module.public_vpc.database_subnets
}
