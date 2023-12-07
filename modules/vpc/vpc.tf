resource "aws_vpc" "sbs_vpc" {
  cidr_block = var.cidr_block
  tags = {
    Name = var.vpc_name
  }
}