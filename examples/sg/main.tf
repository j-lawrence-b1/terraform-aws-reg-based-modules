# ---------------------------------
# locals
# ---------------------------------
locals {
  resource_prefix = "${var.team}-${var.env}-${var.app}"
  default_tags = {
    provisioner = "terraform"
    env = var.env
    team        = var.team
    owner        = var.team
    app = var.app
  }
}

resource "random_string" "suffix" {
  length = 8
  lower  = true
  upper  = true
  special = true
}

# ---------------------------------
# modules
# ---------------------------------
module "public_vpc" {
  source = "../../modules/vpc"

  vpc_name = "${local.resource_prefix}-${module.random_string.suffix.id}"
  tags     = local.default_tags
}

module "sg" {
  source = "../../modules/sg"

  vpc_id = module.public_vpc.vpc_id

  name = "${local.resource_prefix}-${module.random_string.suffix.id}"
  tags = local.default_tags
}
