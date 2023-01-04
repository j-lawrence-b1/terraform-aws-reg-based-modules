terraform {
  required_version = ">= 1.3.0"
}

# Get availability zones for the region configured in the provider.
data "aws_availability_zones" "available" {
  state = "available"
}

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "~> 3.18"

  create_vpc           = var.enable_vpc
  enable_nat_gateway   = length(var.private_subnets) > 0 ? true : false
  enable_dns_hostnames = true

  # These are all features that are turned on by default but I don't want to deal with yet. YMMV.
  enable_vpn_gateway              = false
  create_redshift_subnet_group    = false
  create_elasticache_subnet_group = false
  create_database_subnet_group    = false
  create_egress_only_igw          = false

  name             = var.vpc_name
  cidr             = var.vpc_cidr
  azs              = slice(data.aws_availability_zones.available.names, 0, length(var.public_subnets))
  database_subnets = var.database_subnets
  private_subnets  = var.private_subnets
  public_subnets   = var.public_subnets

  # Allow option to re-use eips created elsewhere. Otherwise, this module will create them.
  single_nat_gateway   = false
  reuse_nat_ips        = length(var.nat_eip_ids) > 0 ? true : false
  external_nat_ip_ids  = var.nat_eip_ids

  tags = var.tags
}
