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

module "tags" {
  source = "../../modules/tags"

  tags = {
    app   = var.app_name
    env   = var.env
    owner = var.owner
    team  = var.team
  }
}

# ---------------------------------
# modules
# ---------------------------------
module "public_vpc" {
  source = "../../modules/vpc"

  vpc_name = "${local.resource_prefix}-${random_string.suffix.id}"

  tags = module.tags.default_tags
}

module "sg" {
  source = "../../modules/sg"

  vpc_id = module.public_vpc.vpc_id

  name          = "${local.resource_prefix}-${random_string.suffix.id}"
  include_my_ip = true
  ingress_cidr_blocks = slice(module.public_vpc.public_subnets_cidr_blocks, 0, 1)

  tags = module.tags.default_tags
}
