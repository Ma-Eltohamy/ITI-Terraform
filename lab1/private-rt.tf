resource "aws_route_table" "iti-private-rt" {
  vpc_id = aws_vpc.iti-vpc.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.iti-nat.id
  }

  tags = {
    Name = "ITI-Private-RT"
  }
}
