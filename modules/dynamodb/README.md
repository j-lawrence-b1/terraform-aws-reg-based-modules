## Requirements

No requirements.

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_dynamodb_table"></a> [dynamodb\_table](#module\_dynamodb\_table) | terraform-aws-modules/dynamodb-table/aws | ~> 3.1 |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_attributes"></a> [attributes](#input\_attributes) | List of name, type maps for table partition and sort keys | `list(map(string))` | n/a | yes |
| <a name="input_billing_mode"></a> [billing\_mode](#input\_billing\_mode) | Controls how you are billed for read/write throughput | `string` | `"PAY_PER_REQUEST"` | no |
| <a name="input_enable_create_table"></a> [enable\_create\_table](#input\_enable\_create\_table) | Whether or not to create a table | `bool` | `true` | no |
| <a name="input_enable_encryption"></a> [enable\_encryption](#input\_enable\_encryption) | Whether or not to enable KMS encryption at rest using an AWS managed KMS customer master key (CMK) | `bool` | `true` | no |
| <a name="input_enable_streams"></a> [enable\_streams](#input\_enable\_streams) | Whether or not to enable DynamoDB Streams on this table. | `bool` | `false` | no |
| <a name="input_partition_key"></a> [partition\_key](#input\_partition\_key) | The attribute to use as the hash (partition) key. Must also be defined as an attribute | `string` | n/a | yes |
| <a name="input_read_capacity"></a> [read\_capacity](#input\_read\_capacity) | The number of read units for this table. Set > 0 if billing\_mode = PROVISIONED | `number` | `null` | no |
| <a name="input_secondary_indexes"></a> [secondary\_indexes](#input\_secondary\_indexes) | Global secondary indexes. Subject to number of GSIs, projected attributes, etc. limits | `list(string)` | `[]` | no |
| <a name="input_sort_key"></a> [sort\_key](#input\_sort\_key) | The attribute to use as a range (sort) key. Must also be defined as an attribute | `string` | `null` | no |
| <a name="input_table_name"></a> [table\_name](#input\_table\_name) | Dynamodb table name | `any` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags | `map(string)` | n/a | yes |
| <a name="input_write_capacity"></a> [write\_capacity](#input\_write\_capacity) | The number of write units for this table. Set > 0 if billing\_mode = PROVISIONED | `number` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_dynamodb_table_arn"></a> [dynamodb\_table\_arn](#output\_dynamodb\_table\_arn) | DynamoDB Table ARN |
| <a name="output_dynamodb_table_id"></a> [dynamodb\_table\_id](#output\_dynamodb\_table\_id) | DynamoDB Table ID |
| <a name="output_dynamodb_table_stream_arn"></a> [dynamodb\_table\_stream\_arn](#output\_dynamodb\_table\_stream\_arn) | The ARN of the Table Stream. Only available when var.stream\_enabled is true |
| <a name="output_dynamodb_table_stream_label"></a> [dynamodb\_table\_stream\_label](#output\_dynamodb\_table\_stream\_label) | A timestamp, in ISO 8601 format of the Table Stream. Only available when var.stream\_enabled is true |
