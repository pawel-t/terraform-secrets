variable db_name {
  type        = string
  description = "Name of your DB"
}

variable engine_version {
  type        = string
  default     = "15.3"
  description = "Postgres engine version"
}

variable allocated_storage {
  type        = number
  default     = 10
  description = "Allocated storage for database"
}

variable db_secrets_file {
  type        = string
  description = "Path to file with DB secrets"
}