## Provision an S3 backend with optional locking table.

This app provisions an S3 bucket with (optional) dynamodb locking table suitable for use as a terraform backend.
It is desined to run with a local backend. Don't commit the tfstate file to git!

## Usage

```
$ terraform init
$ terraform plan
$ terraform apply
```

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | = 1.1.8 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | 4.22.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 4.22.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_s3_backend"></a> [s3\_backend](#module\_s3\_backend) | git@github.com:j-lawrence-b1/terraform-aws-reg-based-modules.git//s3 | v0.0.7 |
| <a name="module_s3_locking_table"></a> [s3\_locking\_table](#module\_s3\_locking\_table) | git@github.com:j-lawrence-b1/terraform-aws-reg-based-modules.git//dynamodb | v0.0.7 |

## Resources

| Name | Type |
|------|------|
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/4.22.0/docs/data-sources/caller_identity) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_app"></a> [app](#input\_app) | Environment | `string` | `"s3-backend"` | no |
| <a name="input_enable_locking_table"></a> [enable\_locking\_table](#input\_enable\_locking\_table) | Boolean whether to create a dynamodb locking table | `bool` | `false` | no |
| <a name="input_env"></a> [env](#input\_env) | Environment | `string` | `"global"` | no |
| <a name="input_region"></a> [region](#input\_region) | AWS region | `string` | `"us-west-2"` | no |
| <a name="input_team"></a> [team](#input\_team) | Team | `string` | `"lb"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_s3_bucket_id"></a> [s3\_bucket\_id](#output\_s3\_bucket\_id) | S3 bucket id |
| <a name="output_s3_locking_table"></a> [s3\_locking\_table](#output\_s3\_locking\_table) | S3 bucket id |
