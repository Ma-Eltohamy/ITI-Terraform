resource "aws_db_subnet_group" "rds_subnet_group" {
  name       = "rds_subnet_group"
  subnet_ids = [aws_subnet.iti-subnet["ITI-Private-SN-1A"].id]
}
resource "aws_db_instance" "rds_mysql" {
  identifier           = "mydb"
  engine               = "mysql"
  instance_class       = "db.t3.micro"
  allocated_storage    = 20
  username             = "admin"
  password             = "mypassword"
  db_subnet_group_name = aws_db_subnet_group.rds_subnet_group.name
}
