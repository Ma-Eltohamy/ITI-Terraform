resource "aws_subnet" "iti-private-sn-1a" {
  vpc_id            = aws_vpc.iti-vpc.id
  cidr_block        = "10.0.2.0/24"
  availability_zone = "us-east-1a"

  tags = {
    Name = "ITI-Private-SN-1A"
  }
}

resource "aws_route_table_association" "private_rt_assoc_1a" {
  subnet_id      = aws_subnet.iti-private-sn-1a.id
  route_table_id = aws_route_table.iti-private-rt.id
}

resource "aws_subnet" "iti-private-sn-1b" {
  vpc_id            = aws_vpc.iti-vpc.id
  cidr_block        = "10.0.3.0/24"
  availability_zone = "us-east-1b"

  tags = {
    Name = "ITI-Private-SN-1B"
  }
}

resource "aws_route_table_association" "private_rt_assoc_1b" {
  subnet_id      = aws_subnet.iti-private-sn-1b.id
  route_table_id = aws_route_table.iti-private-rt.id
}
