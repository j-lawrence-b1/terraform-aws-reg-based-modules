module "tags" {
  source = "rhythmictech/tags/terraform"
  version = "v1.1.1"

  enforce_case = "lower"
  tags = var.tags
}
