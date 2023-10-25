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

data "aws_kms_secrets" "db_secrets" {
  secret {
    name    = "db_secrets"
    payload = filebase64(var.db_secrets_file)
  }
}

locals {
  db_secrets = yamldecode(data.aws_kms_secrets.db_secrets.plaintext["db_secrets"])
}
