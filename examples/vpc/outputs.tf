output "vpc_id" {
  description = "VPC id"
  value       = module.public_vpc.vpc_id
}

output "vpc_name" {
  description = "VPC name"
  value       = module.public_vpc.name
}
