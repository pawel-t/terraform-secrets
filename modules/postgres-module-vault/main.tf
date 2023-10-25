resource "aws_db_instance" "database" {
  allocated_storage    = var.allocated_storage
  db_name              = var.db_name
  engine               = "postgres"
  engine_version       = var.engine_version
  instance_class       = "db.t3.micro"
  username             = local.db_username
  password             = local.db_password
  skip_final_snapshot  = true
}

locals {
  db_username = data.vault_generic_secret.db_secrets.data["db_username"]
  db_password = data.vault_generic_secret.db_secrets.data["db_password"]    
}

data "vault_generic_secret" "db_secrets" {
    provider = vault
    path     = var.db_secrets_vault_path
}
