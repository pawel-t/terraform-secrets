terraform {
  required_version = ">= 1.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.00"
    }
    vault = {
      source  = "hashicorp/vault"
      version = ">= 3.20.1"
    }        
  }
}

terraform {
  backend "s3" {
    bucket         = "pawel-udemy-course-tf-state"
    key            = "secrets/terraform/vault-inside-module/terraform.tfstate"
    encrypt        = true
    region         = "eu-central-1"
    dynamodb_table = "pawel-udemy-course-tf-locks"
  }
}  
 
provider "aws" {
  region  = "eu-central-1"
  profile = "default"
}

provider "vault" {
  address = "http://localhost:8200"
  token   = "${local.token_file.token}"
}

locals {
  token_file = "${jsondecode(file("/tmp/root_token.json"))}"
}

module "db" {
  source = "../../modules/postgres-module-vault"
  db_name = "test_db"
  engine_version = "15.3"
  allocated_storage = 10
  db_secrets_vault_path = "kv/db_secrets"
}


