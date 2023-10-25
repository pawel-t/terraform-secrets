output "endpoint" {
  value       = aws_db_instance.database.endpoint
  description = "Database endpoint"
}

output "address" {
  value       = aws_db_instance.database.address
  description = "Database endpoint"
}

output "port" {
  value       = aws_db_instance.database.port
  description = "Database endpoint"
}
