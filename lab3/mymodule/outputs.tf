output "iti-subnet" {
  # here we have to make a for look to extract all these subnets
  value = { for k, v in aws_subnet.iti-subnet : k => v }
}

output "iti-sg" {
  value = { for name, sg in aws_security_group.sg : name => sg.id }
}

output "iti-vpc" {
  value = aws_vpc.iti-vpc
}
