resource "aws_db_instance" "database" {
  allocated_storage    = var.allocated_storage
  db_name              = var.db_name
  engine               = "postgres"
  engine_version       = var.engine_version
  instance_class       = "db.t3.micro"
  username             = var.db_username
  password             = var.db_password
  skip_final_snapshot  = true
}

