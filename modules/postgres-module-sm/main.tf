resource "aws_db_instance" "database" {
  allocated_storage    = var.allocated_storage
  db_name              = var.db_name
  engine               = "postgres"
  engine_version       = var.engine_version
  instance_class       = "db.t3.micro"
  username             = local.db_secrets.db_username
  password             = local.db_secrets.db_password
  skip_final_snapshot  = true
}

data "aws_secretsmanager_secret_version" "db_secrets" {
    secret_id = var.secret_id
}

locals {
    db_secrets = jsondecode(
        data.aws_secretsmanager_secret_version.db_secrets.secret_string
    )
}