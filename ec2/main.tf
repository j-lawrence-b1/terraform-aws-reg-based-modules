data "aws_ami" "amlinux2" {
  most_recent = true
  owners      = ["amazon"]
  filter {
    name   = "name"
    values = ["amzn2-ami-*"]
  }
  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
  filter {
    name   = "architecture"
    values = ["x86_64"]
  }
}

module "ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 3.0"

  count = var.instance_count

  name = "${var.instance_prefix}-${count.index + 1}"

  ami                     = var.ami != null ? var.ami : data.aws_ami.amlinux2.id
  instance_type           = var.instance_type              # default: "t2.micro"
  key_name                = var.key_name                   # no default
  monitoring              = var.enable_detailed_monitoring # default: false
  disable_api_termination = var.disable_api_termination    # default: false
  vpc_security_group_ids  = var.security_group_ids         # no default
  subnet_id               = var.subnet_id                  # no default

  tags = var.tags # default: {}
}
