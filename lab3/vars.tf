variable "region" {
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

variable "vpc_cidr_block" {
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

variable "s3_bucket_name" {
  default = "terraform-state-bucket-202510"
}

variable "lambda_function_name" {
  default = "TerraformStateChangeNotifier"
}

variable "sender_email" {
  default = "sender_email@here.com"
}

variable "recipient_email" {
  default = "reciver_email@here.com"
}
