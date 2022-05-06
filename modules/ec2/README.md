<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.1.9 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 4.12.1 |
| <a name="provider_local"></a> [local](#provider\_local) | 2.2.2 |
| <a name="provider_tls"></a> [tls](#provider\_tls) | 3.3.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_instance.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance) | resource |
| [aws_key_pair.generated_key](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/key_pair) | resource |
| [aws_security_group.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [local_sensitive_file.pem_file](https://registry.terraform.io/providers/hashicorp/local/latest/docs/resources/sensitive_file) | resource |
| [tls_private_key.this](https://registry.terraform.io/providers/hashicorp/tls/latest/docs/resources/private_key) | resource |
| [aws_ami.ubuntu](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ami) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_ec2_name"></a> [ec2\_name](#input\_ec2\_name) | Name of ec2 instance | `string` | `"sogebot"` | no |
| <a name="input_ec2_size"></a> [ec2\_size](#input\_ec2\_size) | Set for ec2 size you want | `string` | `"t3.micro"` | no |
| <a name="input_key_name"></a> [key\_name](#input\_key\_name) | ssh keyname | `string` | `"sogebot-ssh"` | no |
| <a name="input_root_volume_size"></a> [root\_volume\_size](#input\_root\_volume\_size) | Root volume size | `number` | `30` | no |
| <a name="input_root_volume_throughput"></a> [root\_volume\_throughput](#input\_root\_volume\_throughput) | Root volume throughput | `number` | `250` | no |
| <a name="input_root_volume_type"></a> [root\_volume\_type](#input\_root\_volume\_type) | Root volume type | `string` | `"gp3"` | no |
| <a name="input_subnet_id"></a> [subnet\_id](#input\_subnet\_id) | Subnet ID to put ec2 in | `string` | `"subnet-cc0c60e7"` | no |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | VPC ID | `string` | `"vpc-487ef730"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_ec2-arn"></a> [ec2-arn](#output\_ec2-arn) | arn of the ec2 instance |
| <a name="output_ec2-public_dns"></a> [ec2-public\_dns](#output\_ec2-public\_dns) | public\_dns of the ec2 instance |
| <a name="output_ubuntu-ami"></a> [ubuntu-ami](#output\_ubuntu-ami) | AMI used for ec2 instance |
<!-- END_TF_DOCS -->