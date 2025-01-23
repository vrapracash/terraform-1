# use.output_instance_info
# output instance_info == aws_instance.expense
output "instance_info" {
  value       = "aws_instance.expense"
}

output "ami_id" {
  value       = "data.aws_ami.joindevops.id"
}

