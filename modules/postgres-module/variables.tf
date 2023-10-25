variable db_name {
  type        = string
  description = "Name of your DB"
}

variable db_username {
  type        = string
  description = "Database username"
  sensitive   = true
}

variable db_password {
  type        = string
  description = "Database password"
  sensitive   = true
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