data "aws_secretsmanager_secret_version" "db_secrets" {
    secret_id = "secrets"
}

locals {
    db_secrets = jsondecode(
        data.aws_secretsmanager_secret_version.db_secrets.secret_string
    )
}