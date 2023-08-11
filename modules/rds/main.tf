resource "aws_db_instance" "default" {
  allocated_storage    = 10
  db_name              = "mydb"
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = "db.t3.micro"
  username             = "foo"
  password             = "foobarbaz"
  parameter_group_name = "default.mysql5.7"
  skip_final_snapshot  = true

  tags = {
    Name        = "My RDS"
    Environment = "Dev"
    purpose = "UI"
    Owner = " LL"
    Backup = "7"
    pacecode = "ABS1234"
  }
}