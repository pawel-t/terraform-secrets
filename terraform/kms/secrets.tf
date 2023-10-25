data "aws_kms_secrets" "db_secrets" {
  secret {
    name    = "db_secrets"
    payload = filebase64("secrets.yml")
  }
}

locals {
  db_secrets = yamldecode(data.aws_kms_secrets.db_secrets.plaintext["db_secrets"])
}
