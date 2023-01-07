# ---------------------------------
# Locals
# ---------------------------------
locals {
  resource_prefix = "${var.team}-${var.env}-${var.app_name}"
}

# ---------------------------------
# Resources
# ---------------------------------
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
    app   = var.app_name
    env   = var.env
    owner = var.owner
    team  = var.team
  }
}

module "table" {
  source = "../../modules/dynamodb"

  table_name        = "${local.resource_prefix}-${random_string.suffix.id}"
  partition_key     = "string_key"
  sort_key          = "string_key"
  enable_encryption = false # Not needed for testing.
  attributes = [
    {
      name = "string_key"
      type = "S"
    },
    {
      name = "number_key"
      type = "N"
    }
  ]

  tags = module.tags.default_tags
}
