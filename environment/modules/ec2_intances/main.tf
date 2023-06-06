resource "aws_ami" "ec2_intance" {
  count               = var.numbers_instances   
  name                = "${var.name}-${var.environment_name}-${count.index} + 1"
  virtualization_type = var.virtualization_type
  root_device_name    = var.root_device_name
  imds_support        = var.imds_support
  ebs_block_device {
    device_name = var.root_device_name
    snapshot_id = var.snapshot_id
    volume_size = 20
  }
}