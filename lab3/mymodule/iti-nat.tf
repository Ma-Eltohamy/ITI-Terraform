# allocating a public ip address from the amazon public pool
resource "aws_eip" "iti-elastic-ip" {
  domain           = "vpc"
  public_ipv4_pool = "amazon" # Default AWS pool (optional)
}

resource "aws_nat_gateway" "iti-nat" {
  allocation_id = aws_eip.iti-elastic-ip.id


  subnet_id = aws_subnet.iti-subnet["ITI-Public-SN-1A"].id

  tags = {
    Name = "ITI-NAT"
  }

  depends_on = [aws_internet_gateway.iti-igw]
}
