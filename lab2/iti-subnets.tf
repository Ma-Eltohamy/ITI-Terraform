# This will create all the subnets (Public & Private)
resource "aws_subnet" "iti-subnet" {
  for_each                = { for subnet in var.subnet_list : subnet.name => subnet }
  vpc_id                  = aws_vpc.iti-vpc.id
  cidr_block              = each.value.cidr
  availability_zone       = "${var.region}${each.value.az}"
  map_public_ip_on_launch = each.value.type == "public" ? true : false

  tags = {
    Name = each.value.name
  }
}

resource "aws_route_table_association" "iti-public-ass" {
  for_each       = { for subnet in var.subnet_list : subnet.name => subnet if subnet.type == "public" }
  subnet_id      = aws_subnet.iti-subnet[each.key].id
  route_table_id = aws_route_table.iti-public-rt.id
}

resource "aws_route_table_association" "iti-private-ass" {
  for_each       = { for subnet in var.subnet_list : subnet.name => subnet if subnet.type == "private" }
  subnet_id      = aws_subnet.iti-subnet[each.key].id
  route_table_id = aws_route_table.iti-private-rt.id
}
