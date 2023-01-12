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
    app         = var.app_name
    env         = var.env
    owner       = var.owner
    team        = var.team
  }
}

module "vpc" {
  source = "../../modules/vpc"

  vpc_name = "${local.resource_prefix}-${random_string.suffix.id}"
  tags     = module.tags.default_tags
}
