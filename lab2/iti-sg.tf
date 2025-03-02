# allowing ssh from all
resource "aws_security_group" "allow_ssh" {
  name        = "allow_ssh"
  description = "Allow SSH inbound traffic and all outbound traffic"
  vpc_id      = aws_vpc.iti-vpc.id

  tags = {
    Name = "allow_ssh"
  }
}

resource "aws_vpc_security_group_ingress_rule" "ssh-ingress" {
  security_group_id = aws_security_group.allow_ssh.id

  cidr_ipv4   = "0.0.0.0/0"
  from_port   = 22
  to_port     = 22
  ip_protocol = "tcp"
}

#------------------------------------------------------------
# allowing ssh and prot 3000 from local only

resource "aws_security_group" "allow_ssh_3port" {
  name        = "allow_ssh_3port"
  description = "Allow SSH and port 3000"
  vpc_id      = aws_vpc.iti-vpc.id

  tags = {
    Name = "allow_ssh_3Port"
  }
}

resource "aws_vpc_security_group_ingress_rule" "allow_ssh_ingress" {
  security_group_id = aws_security_group.allow_ssh_3port.id
  cidr_ipv4         = "10.0.0.0/16"
  from_port         = 22
  to_port           = 22
  ip_protocol       = "tcp"
}

resource "aws_vpc_security_group_ingress_rule" "allow_3000_ingress" {
  security_group_id = aws_security_group.allow_ssh_3port.id
  cidr_ipv4         = "10.0.0.0/16"
  from_port         = 3000
  to_port           = 3000
  ip_protocol       = "tcp"
}

