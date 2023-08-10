resource "aws_vpc" "vpc" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = var.vpc_name
  }
}

resource "aws_subnet" "subnet" {
  for_each = { for subnet in var.subnets : subnet.name => subnet }

  vpc_id     = aws_vpc.vpc.id
  cidr_block = each.value.cidr_block
  tags = {
    Name = var.snet_name
  }

  depends_on = [
    aws_vpc.vpc
  ]
}