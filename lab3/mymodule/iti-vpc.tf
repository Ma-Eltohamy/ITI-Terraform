resource "aws_vpc" "iti-vpc" {
  cidr_block       = var.vpc_cidr_block
  instance_tenancy = "default"

  tags = {
    Name = "ITI-VPC"
  }
}
