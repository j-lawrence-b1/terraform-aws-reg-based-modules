output "ec2_instance_ids" {
  description = "EC2 instance ids"
  value = module.ec2.ec2_instance_ids
}

output "ec2_public_ips" {
  description = "EC2 public ids"
  value = module.ec2.ec2_public_ips
}
