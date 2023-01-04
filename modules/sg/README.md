## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_http"></a> [http](#provider\_http) | n/a |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_sg"></a> [sg](#module\_sg) | terraform-aws-modules/security-group/aws | n/a |

## Resources

| Name | Type |
|------|------|
| [http_http.myip](https://registry.terraform.io/providers/hashicorp/http/latest/docs/data-sources/http) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_custom_ingress_rules"></a> [custom\_ingress\_rules](#input\_custom\_ingress\_rules) | List of custom port, protocol, description, cider\_block ingress rules | <pre>list(object(<br>    {<br>      port        = string<br>      protocol    = string<br>      cidr_blocks = list(string)<br>      description = string<br>    })<br>  )</pre> | `[]` | no |
| <a name="input_description"></a> [description](#input\_description) | Security group description | `string` | `"SSH, HTTP ingress from anywhere"` | no |
| <a name="input_ingress_cidr_blocks"></a> [ingress\_cidr\_blocks](#input\_ingress\_cidr\_blocks) | List of ingress CIDRs. Will be joined to IP of the TF execution env. | `list(string)` | `[]` | no |
| <a name="input_ingress_rules"></a> [ingress\_rules](#input\_ingress\_rules) | List of pre-fabricated terraform-aws security\_group ingress rules | `list(string)` | <pre>[<br>  "http-80-tcp",<br>  "ssh-tcp"<br>]</pre> | no |
| <a name="input_name"></a> [name](#input\_name) | Security group name | `string` | `"http-ssh-sg"` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Default tags | `map(string)` | n/a | yes |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | VPC id | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_security_group_id"></a> [security\_group\_id](#output\_security\_group\_id) | Security group id |
| <a name="output_security_group_name"></a> [security\_group\_name](#output\_security\_group\_name) | Security group name |
