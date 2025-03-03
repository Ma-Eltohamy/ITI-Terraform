resource "aws_security_group" "sg" {
  for_each    = var.security_groups
  name        = each.key
  description = each.value.description
  vpc_id      = aws_vpc.iti-vpc.id

  tags = {
    Name = each.key
  }
}

resource "aws_vpc_security_group_ingress_rule" "ingress" {
  for_each          = { for sg_name, sg in var.security_groups : sg_name => sg.rules }
  security_group_id = aws_security_group.sg[each.key].id
  cidr_ipv4         = each.value[0].cidr # it can be handled from the for_each insted of [0]
  from_port         = each.value[0].from_port
  to_port           = each.value[0].to_port
  ip_protocol       = each.value[0].protocol
}
