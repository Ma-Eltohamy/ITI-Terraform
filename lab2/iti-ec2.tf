
resource "aws_instance" "iti-ec2" {
  count         = length(var.subnet_list)
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance_type
  subnet_id     = aws_subnet.iti-subnet[count.index].id

  vpc_security_group_ids      = var.subnet_list[count.index].type == "public" ? [aws_security_group.allow_ssh.id] : [aws_security_group.allow_ssh_3port]
  associate_public_ip_address = var.subnet_list[count.index].type == "public" ? true : false

  tags = {
    Name = var.ec2_names[count.index]
  }

  provisioner "local-exec" {
    command = var.ec2_names[count.index] == "bastion" ? "echo ${self.public_ip} >> inventory" : "echo ''"
  }
}
