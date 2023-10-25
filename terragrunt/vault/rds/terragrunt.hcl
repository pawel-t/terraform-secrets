terraform {
    source = "../../../modules/postgres-module-vault"
}

include "config" {
  path = find_in_parent_folders()
}

locals {
  token_file = "${jsondecode(file("/tmp/root_token.json"))}"
}

generate "provider_vault" {
  path = "provider-vault.tf"
  if_exists = "overwrite_terragrunt"
  contents = <<EOF
provider "vault" {
  address = "http://localhost:8200"
  token   = "${local.token_file.token}"
}
EOF
}

inputs = {
  db_name = "test_db"
  engine_version = "15.3"
  allocated_storage = 10
  db_secrets_vault_path = "kv/db_secrets"  
} 

