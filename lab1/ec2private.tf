resource "aws_instance" "private-ec2" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t3.micro"

  subnet_id              = aws_subnet.iti-private-sn-1a.id
  vpc_security_group_ids = [aws_security_group.allow_ssh_3port.id]

  tags = {
    Name = "application"
  }
}
