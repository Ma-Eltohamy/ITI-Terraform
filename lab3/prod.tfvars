region = "us-east-1"

vpc_cidr_block = "10.0.0.0/16"

env           = "dev"
no_public_ec2 = 2

instance_type = "t2.micro"

ec2_names = ["bastion", "Application", "private1", "private2"]

subnet_list = [
  {
    name = "NTI-Public-SN-1A"
    cidr = "10.0.0.0/24"
    type = "public"
    az   = "a"
  },
  {
    name = "NTI-Public-SN-1B"
    cidr = "10.0.1.0/24"
    type = "public"
    az   = "b"
  },
  {
    name = "NTI-Private-SN-1A"
    cidr = "10.0.2.0/24"
    type = "private"
    az   = "a"
  },
  {
    name = "NTI-Private-SN-1B"
    cidr = "10.0.3.0/24"
    type = "private"
    az   = "b"
  }
]
