# ---------------------------------
# locals
# ---------------------------------
locals {
  resource_prefix = "${var.team}-${var.env}-${var.app_name}"
}

resource "random_string" "suffix" {
  length  = 8
  lower   = true
  upper   = false
  special = false
}

# ---------------------------------
# modules
# ---------------------------------
module "tags" {
  source = "../../modules/tags"

  tags = {
    app   = var.app_name
    env   = var.env
    owner = var.owner
    team  = var.team
  }
}

module "public_vpc" {
  source = "../../modules/vpc"

  vpc_name = "${local.resource_prefix}-${random_string.suffix.id}"
  tags     = module.tags.default_tags
}

module "sg" {
  source = "../../modules/sg"

  vpc_id              = module.public_vpc.vpc_id
  name                = "${local.resource_prefix}-${random_string.suffix.id}"
  ingress_cidr_blocks = slice(module.public_vpc.public_subnets_cidr_blocks, 0, 1)
  include_my_ip       = var.enable_local_access
  tags                = module.tags.default_tags
}

module "ec2" {
  source = "../../modules/ec2"

  instance_count          = var.instance_count
  instance_prefix         = "${local.resource_prefix}-${random_string.suffix.id}"
  key_name                = module.key_pair.key_pair_name
  subnet_id               = module.public_vpc.public_subnets[0]
  security_group_ids      = [module.sg.security_group_id]
  disable_api_termination = false
  tags                    = module.tags.default_tags
}

module "key_pair" {
  source = "terraform-aws-modules/key-pair/aws"

  create     = var.create_key_pair
  key_name   = "${local.resource_prefix}-${random_string.suffix.id}"
  public_key = file(pathexpand(var.public_key_file))
  tags       = module.tags.default_tags
}
