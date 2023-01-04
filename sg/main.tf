module "sg" {
  source = "terraform-aws-modules/security-group/aws"

  name        = var.name
  description = var.description
  vpc_id      = var.vpc_id

  ingress_cidr_blocks = var.ingress_cidr_blocks
  ingress_rules       = var.ingress_rules

  tags = var.tags
}
