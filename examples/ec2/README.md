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
| <a name="module_ec2"></a> [ec2](#module\_ec2) | ../../modules/ec2 | n/a |
| <a name="module_key_pair"></a> [key\_pair](#module\_key\_pair) | terraform-aws-modules/key-pair/aws | n/a |
| <a name="module_public_vpc"></a> [public\_vpc](#module\_public\_vpc) | ../../modules/vpc | n/a |
| <a name="module_sg"></a> [sg](#module\_sg) | ../../modules/sg | n/a |
| <a name="module_tags"></a> [tags](#module\_tags) | ../../modules/tags | n/a |

## Resources

| Name | Type |
|------|------|
| [random_string.suffix](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/string) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_app_name"></a> [app\_name](#input\_app\_name) | Application name | `string` | `"test-ec2"` | no |
| <a name="input_create_key_pair"></a> [create\_key\_pair](#input\_create\_key\_pair) | Boolean to enable key pair creation. | `bool` | `true` | no |
| <a name="input_enable_local_access"></a> [enable\_local\_access](#input\_enable\_local\_access) | Allow ec2 access from the terraform environment public ip. | `bool` | `true` | no |
| <a name="input_env"></a> [env](#input\_env) | One of 'prd', 'stg', or 'dev' | `string` | `"dev"` | no |
| <a name="input_instance_count"></a> [instance\_count](#input\_instance\_count) | EC2 instance count | `number` | `1` | no |
| <a name="input_instance_type"></a> [instance\_type](#input\_instance\_type) | EC2 instance type | `string` | `"t2.micro"` | no |
| <a name="input_owner"></a> [owner](#input\_owner) | Owner name | `string` | `"lb"` | no |
| <a name="input_public_key_file"></a> [public\_key\_file](#input\_public\_key\_file) | Name of file containing content for aws\_key\_pair creation | `string` | `"~/.ssh/terraform.pub"` | no |
| <a name="input_region"></a> [region](#input\_region) | AWS region | `string` | `"us-west-2"` | no |
| <a name="input_team"></a> [team](#input\_team) | Team name | `string` | `"casab"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_ec2_instance_ids"></a> [ec2\_instance\_ids](#output\_ec2\_instance\_ids) | EC2 instance ids |
| <a name="output_ec2_public_ips"></a> [ec2\_public\_ips](#output\_ec2\_public\_ips) | EC2 public ids |
