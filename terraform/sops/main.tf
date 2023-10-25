terraform {
  required_version = ">= 1.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.00"
    }
    sops = {
      source  = "carlpett/sops"
      version = ">= 0.7.2"
    }    
  }
}

terraform {
  backend "s3" {
    bucket         = "pawel-udemy-course-tf-state"
    key            = "secrets/terraform/sops/terraform.tfstate"
    encrypt        = true
    region         = "eu-central-1"
    dynamodb_table = "pawel-udemy-course-tf-locks"
  }
}  
 

provider "aws" {
  region  = "eu-central-1"
  profile = "default"
}


module "db" {
  source = "../../modules/postgres-module"
  db_name = "test_db"
	db_username = local.db_username
  db_password = local.db_password
  engine_version = "15.3"
  allocated_storage = 10
}


