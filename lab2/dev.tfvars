region = "us-east-1"

vpc_cidr_block = "10.0.0.0/16"

env           = "dev"
no_public_ec2 = 2

instance_type = "t2.micro"

ec2_config = [
  {
    name   = "bastion"
    subnet = "ITI-Public-SN-1A"
    type   = "public"
  },
  {
    name   = "Application"
    subnet = "ITI-Public-SN-1B"
    type   = "public"
  },
  {
    name   = "private1"
    subnet = "ITI-Private-SN-1A"
    type   = "private"
  },
  {
    name   = "private2"
    subnet = "ITI-Private-SN-1B"
    type   = "private"
  }
]

subnet_list = [
  {
    name = "ITI-Public-SN-1A"
    cidr = "10.0.0.0/24"
    type = "public"
    az   = "a"
  },
  {
    name = "ITI-Public-SN-1B"
    cidr = "10.0.1.0/24"
    type = "public"
    az   = "b"
  },
  {
    name = "ITI-Private-SN-1A"
    cidr = "10.0.2.0/24"
    type = "private"
    az   = "a"
  },
  {
    name = "ITI-Private-SN-1B"
    cidr = "10.0.3.0/24"
    type = "private"
    az   = "b"
  }
]
