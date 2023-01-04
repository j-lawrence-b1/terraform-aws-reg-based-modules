## Requirements

Provision a simple VPC.

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.1.8 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_vpc"></a> [vpc](#module\_vpc) | terraform-aws-modules/vpc/aws | ~> 3.14 |

## Resources

| Name | Type |
|------|------|
| [aws_availability_zones.available](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/availability_zones) | data source |

## Usage
The example below sources from the HEAD of the master branch. You should source from a tag.
```
module "public_vpc" {
  source = "git@github.com:j-lawrence-b1/terraform-aws-reg-based-modules.git//vpc?ref=master"

  enable_vpc = var.enable_vpc
  vpc_name   = "my-vpc-name"

  tags = local.default_tags
}
```
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_enable_vpc"></a> [enable\_vpc](#input\_enable\_vpc) | Boolean to enable vpc creation | `string` | `"true"` | no |
| <a name="input_private_subnets"></a> [private\_subnets](#input\_private\_subnets) | List of private subnet CIDR blocks | `list(string)` | `[]` | no |
| <a name="input_public_subnets"></a> [public\_subnets](#input\_public\_subnets) | List of public subnet CIDR blocks | `list(string)` | <pre>[<br>  "10.0.0.0/24",<br>  "10.0.1.0/24"<br>]</pre> | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Default tags | `map(string)` | n/a | yes |
| <a name="input_vpc_cidr"></a> [vpc\_cidr](#input\_vpc\_cidr) | VPC CIDR block | `string` | `"10.0.0.0/22"` | no |
| <a name="input_vpc_name"></a> [vpc\_name](#input\_vpc\_name) | Name of the VPC | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_private_subnets"></a> [private\_subnets](#output\_private\_subnets) | Private subnet ids |
| <a name="output_public_subnets"></a> [public\_subnets](#output\_public\_subnets) | Public subnet ids |
| <a name="output_vpc_id"></a> [vpc\_id](#output\_vpc\_id) | VPC id |
