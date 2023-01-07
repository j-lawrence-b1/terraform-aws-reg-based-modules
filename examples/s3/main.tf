# ---------------------------------
# Locals
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
# Modules
# ---------------------------------
module "tags" {
  source = "../../modules/tags"

  tags = {
    app = var.app_name
    env = var.env
    team        = var.team
    owner = var.owner
  }
}

module "s3_basic" {
  source = "../../modules/s3"

  bucket_name = "${local.resource_prefix}-${random_string.suffix.id}"

  tags = module.tags.default_tags
}
