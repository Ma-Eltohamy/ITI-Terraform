resource "aws_instance" "public-ec2" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t3.micro"

  subnet_id              = aws_subnet.iti-public-sn-1a.id
  vpc_security_group_ids = [aws_security_group.allow_ssh.id]

  tags = {
    Name = "bastion"
  }
}
