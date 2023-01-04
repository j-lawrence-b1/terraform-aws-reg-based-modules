## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.1.8 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_dynamodb_table"></a> [dynamodb\_table](#module\_dynamodb\_table) | terraform-aws-modules/dynamodb-table/aws | 2.0.0 |

## Resources

No resources.

## Usage
The example below sources from the HEAD of the master branch. You should use a tag reference in your code.
```
module "s3_locking_table" {
  source = "git@github.com:j-lawrence-b1/terraform-aws-reg-based-modules.git//dynamodb?ref=master"

  create_table = var.create_table # default: true

  table_name    = "my-table-name" # no default
  partition_key = "my-hash-key"   # no default
  attributes = [                  # no default
    {
      name = "my-hash-key"
      type = "S"
    },
    {
      name = "my-sort-key-1"
      type = "S"
    }
  ]

  tags = var.tags                 # no default (I'm harsh that way)
}
```

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_attributes"></a> [attributes](#input\_attributes) | List of name, type maps for table partition and sort keys. | `list(map(string))` | n/a | yes |
| <a name="input_create_table"></a> [create\_table](#input\_create\_table) | Boolean whether to create a table. | `bool` | `true` | no |
| <a name="input_partition_key"></a> [partition\_key](#input\_partition\_key) | Name of key to use for the hash (partition) key. Must be in attributes list | `string` | n/a | yes |
| <a name="input_table_name"></a> [table\_name](#input\_table\_name) | Dynamodb table name | `any` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags | `map(string)` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_dynamodb_table_arn"></a> [dynamodb\_table\_arn](#output\_dynamodb\_table\_arn) | DynamoDB Table ARN |
| <a name="output_dynamodb_table_id"></a> [dynamodb\_table\_id](#output\_dynamodb\_table\_id) | DynamoDB Table ID |
