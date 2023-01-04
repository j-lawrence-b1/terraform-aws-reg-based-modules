data "http" "myip" {
  provider = http
  url = "http://ipv4.icanhazip.com"
}

locals {
  myip           = "${chomp(data.http.myip.response_body)}/32"
  my_cidr_blocks = concat(var.ingress_cidr_blocks, [local.myip])
}

module "sg" {
  source = "terraform-aws-modules/security-group/aws"

  name        = var.name
  description = var.description
  vpc_id      = var.vpc_id

  ingress_cidr_blocks = local.my_cidr_blocks
  ingress_rules       = var.ingress_rules
  ingress_with_cidr_blocks = [
    for rule in var.custom_ingress_rules : {
      from_port   = rule["port"]
      to_port     = rule["port"] # FTM, disallow port mapping.
      protocol    = rule["protocol"]
      description = rule["description"] == null ? "Ingress:${rule["port"]}:${rule["protocol"]}":rule["description"]
      cidr_blocks = length(rule["cidr_blocks"]) > 0 ? concat(rule["cidr_blocks"], [local.myip]) : local.my_cidr_blocks
    }
  ]

  tags = var.tags
}
