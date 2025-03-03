variable "vpc_cidr_block" {
  type = string
}

variable "region" {
  type = string
}

variable "subnet_list" {
  type = list(object({
    name = string
    cidr = string
    type = string
    az   = string
  }))
}

variable "security_groups" {
  type = map(object({
    description = string
    rules = list(object({
      cidr      = string
      from_port = number
      to_port   = number
      protocol  = string
    }))
  }))
}

