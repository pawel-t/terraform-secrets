provider "vault" {
  address = "http://localhost:8200"
  token   = "${local.token_file.token}"
}

locals {
  token_file = "${jsondecode(file("/tmp/root_token.json"))}"
  db_username = data.vault_generic_secret.db_secrets.data["db_username"]
  db_password = data.vault_generic_secret.db_secrets.data["db_password"]    
}

data "vault_generic_secret" "db_secrets" {
    provider = vault
    path     = "kv/db_secrets"
}

