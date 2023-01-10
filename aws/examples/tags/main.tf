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
