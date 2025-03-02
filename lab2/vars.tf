variable "region" {
  type = string
}

variable "vpc_cidr_block" {
  type = string
}

variable "env" {
  type    = string
  default = "dev"
}

variable "instance_type" {
  type = string
}

variable "ec2_config" {
  type = list(any)
}

variable "no_public_ec2" {
  type = number
}

variable "subnet_list" {
  type = list(object({
    name = string
    cidr = string
    type = string
    az   = string
  }))
}
