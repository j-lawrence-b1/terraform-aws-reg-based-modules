## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_s3_bucket"></a> [s3\_bucket](#module\_s3\_bucket) | terraform-aws-modules/s3-bucket/aws | ~> 3.6 |
| <a name="module_s3_log_bucket"></a> [s3\_log\_bucket](#module\_s3\_log\_bucket) | terraform-aws-modules/s3-bucket/aws | ~> 3.6 |

## Resources

| Name | Type |
|------|------|
| [aws_s3_bucket_lifecycle_configuration.bucket](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_lifecycle_configuration) | resource |
| [aws_s3_bucket_lifecycle_configuration.logs](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_lifecycle_configuration) | resource |
| [aws_s3_bucket_logging.bucket](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_logging) | resource |
| [aws_s3_bucket_logging.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_logging) | resource |
| [aws_s3_bucket_server_side_encryption_configuration.bucket](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_server_side_encryption_configuration) | resource |
| [aws_s3_bucket_server_side_encryption_configuration.logs](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_server_side_encryption_configuration) | resource |
| [aws_s3_bucket_versioning.bucket](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_versioning) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_access_grant_rules"></a> [access\_grant\_rules](#input\_access\_grant\_rules) | S3 bucket access grants. Conflicts with acl | `list(map(string))` | `[]` | no |
| <a name="input_access_policy_document"></a> [access\_policy\_document](#input\_access\_policy\_document) | S3 bucket IAM policy, as a valid JSON document | `string` | `null` | no |
| <a name="input_acl"></a> [acl](#input\_acl) | Canned bucket ACL. Set to log-delivery-write for logging buckets. Set to null if using grants or access\_policy | `string` | `"private"` | no |
| <a name="input_bucket_name"></a> [bucket\_name](#input\_bucket\_name) | S3 bucket name | `any` | n/a | yes |
| <a name="input_cors_rules"></a> [cors\_rules](#input\_cors\_rules) | Cross-Origin Resource Sharing (CORS) rules | `list(map(string))` | `[]` | no |
| <a name="input_enable_access_policy"></a> [enable\_access\_policy](#input\_enable\_access\_policy) | Set true to enable attaching an iam bucket policy | `bool` | `false` | no |
| <a name="input_enable_bucket"></a> [enable\_bucket](#input\_enable\_bucket) | Boolean whether to create the bucket | `bool` | `true` | no |
| <a name="input_enable_lifecycle"></a> [enable\_lifecycle](#input\_enable\_lifecycle) | Boolean whether to enable a lifecycle rule for old versions and incomplete multipart uploads. | `bool` | `false` | no |
| <a name="input_enable_logging"></a> [enable\_logging](#input\_enable\_logging) | Boolean whether to enable s3 logging. | `bool` | `false` | no |
| <a name="input_enable_public_access"></a> [enable\_public\_access](#input\_enable\_public\_access) | If false, forbid all public access via user policy or object acls. | `bool` | `false` | no |
| <a name="input_enable_server_side_encryption"></a> [enable\_server\_side\_encryption](#input\_enable\_server\_side\_encryption) | Boolean whether to enable AES256 server side encription. | `bool` | `true` | no |
| <a name="input_enable_versioning"></a> [enable\_versioning](#input\_enable\_versioning) | Set true to enable versioning | `bool` | `true` | no |
| <a name="input_lifecycle_expiration_days"></a> [lifecycle\_expiration\_days](#input\_lifecycle\_expiration\_days) | Number of days before expiring s3 bucket objects. Must be nonzero if enable\_lifecycle = true | `number` | `null` | no |
| <a name="input_log_bucket_name"></a> [log\_bucket\_name](#input\_log\_bucket\_name) | Custom bucket name for logging. Defaults to <bucket\_name>-logs | `string` | `null` | no |
| <a name="input_log_enable_lifecycle"></a> [log\_enable\_lifecycle](#input\_log\_enable\_lifecycle) | Boolean whether to enable a basic version and multipart lifecycle rule on the logging bucket. | `bool` | `false` | no |
| <a name="input_log_lifecycle_expiration_days"></a> [log\_lifecycle\_expiration\_days](#input\_log\_lifecycle\_expiration\_days) | Number of days before expiring s3 log bucket objects. | `number` | `null` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags | `map(string)` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_s3_bucket_id"></a> [s3\_bucket\_id](#output\_s3\_bucket\_id) | S3 bucket ID |
| <a name="output_s3_log_bucket_id"></a> [s3\_log\_bucket\_id](#output\_s3\_log\_bucket\_id) | S3 bucket ID |
