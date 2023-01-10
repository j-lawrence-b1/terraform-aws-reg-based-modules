## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | = 1.3.7 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | 4.48.0 |
| <a name="requirement_http"></a> [http](#requirement\_http) | 3.2.1 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_random"></a> [random](#provider\_random) | 3.4.3 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_public_vpc"></a> [public\_vpc](#module\_public\_vpc) | ../../modules/vpc | n/a |
| <a name="module_tags"></a> [tags](#module\_tags) | ../../modules/tags | n/a |

## Resources

| Name | Type |
|------|------|
| [random_string.suffix](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/string) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_app_name"></a> [app\_name](#input\_app\_name) | Application name | `string` | `"test-vpc"` | no |
| <a name="input_env"></a> [env](#input\_env) | One of 'prd', 'stg', or 'dev' | `string` | `"dev"` | no |
| <a name="input_owner"></a> [owner](#input\_owner) | Owner name | `string` | `"lb"` | no |
| <a name="input_region"></a> [region](#input\_region) | AWS region | `string` | `"us-west-2"` | no |
| <a name="input_team"></a> [team](#input\_team) | Team name | `string` | `"casab"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_database_subnet_ids"></a> [database\_subnet\_ids](#output\_database\_subnet\_ids) | Database subnet ids |
| <a name="output_private_subnet_ids"></a> [private\_subnet\_ids](#output\_private\_subnet\_ids) | Private subnet ids |
| <a name="output_public_subnet_ids"></a> [public\_subnet\_ids](#output\_public\_subnet\_ids) | Public subnet ids |
| <a name="output_vpc_id"></a> [vpc\_id](#output\_vpc\_id) | VPC id |
| <a name="output_vpc_name"></a> [vpc\_name](#output\_vpc\_name) | VPC name |
