# ---------------------------------
# Data resources
# ---------------------------------
data "aws_caller_identity" "current" {}

# ---------------------------------
# Locals
# ---------------------------------
locals {
  resource_prefix = "${var.team}-${var.env}-${data.aws_caller_identity.current.account_id}"
  default_tags = {
    provisioner = "terraform"
    environment = var.env
    team        = var.team
    application = var.app
  }
}

resource "random_pet" "suffix" {
  length = 1
}

# ---------------------------------
# Modules
# ---------------------------------
module "s3_basic" {
  source = "../../modules/s3"

  bucket_name = "${local.resource_prefix}"

  tags = local.default_tags
}

