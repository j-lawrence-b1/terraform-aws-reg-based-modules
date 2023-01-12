output "vpc_id" {
  description = "VPC id"
  value       = module.vpc.vpc_id
}

output "vpc_name" {
  description = "VPC name"
  value       = module.vpc.name
}

output "public_subnet_ids" {
  description = "Public subnet ids"
  value       = module.vpc.public_subnets
}

output "private_subnet_ids" {
  description = "Private subnet ids"
  value       = module.vpc.private_subnets
}

output "database_subnet_ids" {
  description = "Database subnet ids"
  value       = module.vpc.database_subnets
}

#output "nat_public_ips" {
#  description = "NAT public ids"
#  value       = module.vpc.nat_public_ids
#}
