resource "aws_route_table" "iti-public-rt" {
  vpc_id = aws_vpc.iti-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.iti-igw.id
  }

  tags = {
    Name = "ITI-Public-RT"
  }
}
