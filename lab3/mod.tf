module "network" {
  source = "./mymodule/"

  vpc_cidr_block = var.vpc_cidr_block

  region = var.region

  subnet_list = var.subnet_list

  security_groups = var.security_groups

}
