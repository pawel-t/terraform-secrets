terraform {
    source = "../../../modules/postgres-module"
}

include "config" {
  path = find_in_parent_folders()
}

locals {
  secret_vars = yamldecode(sops_decrypt_file("secrets.yml"))
}

inputs = {
  db_name = "test_db"
  db_username = local.secret_vars.db_username
  db_password = local.secret_vars.db_password
  engine_version = "15.3"
  allocated_storage = 10
}