terraform {
    source = "../../../modules/postgres-module/"
}

include "config" {
  path = find_in_parent_folders()
}

inputs = {
  db_name = "test_db"
  engine_version = "15.3"
  allocated_storage = 10
}  