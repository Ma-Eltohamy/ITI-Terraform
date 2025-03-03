resource "aws_instance" "iti-ec2" {
  count         = length(var.ec2_config)
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance_type
  subnet_id     = module.network.iti-subnet[var.ec2_config[count.index].subnet].id

  vpc_security_group_ids = var.ec2_config[count.index].type == "public" ? [module.network.iti-sg["allow_ssh"]] : [module.network.iti-sg["allow_ssh_3port"]]

  associate_public_ip_address = var.ec2_config[count.index].type == "public" ? true : false

  tags = {
    Name = var.ec2_config[count.index].name
  }

  provisioner "local-exec" {
    command = var.ec2_config[count.index].name == "bastion" ? "echo ${self.public_ip} >> inventory" : "echo ''"
  }
}
