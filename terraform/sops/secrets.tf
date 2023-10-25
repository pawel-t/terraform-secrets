provider "sops" {}

data "sops_file" "db_secrets" {
  source_file = "secrets.yml"
}

locals {
	db_username = data.sops_file.db_secrets.data["db_username"]
	db_password = data.sops_file.db_secrets.data["db_password"]
}