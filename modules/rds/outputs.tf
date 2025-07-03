output "db_endpoint" {
  value = aws_db_instance.spotter_db.endpoint
}

output "db_name" {
  value = aws_db_instance.spotter_db.db_name
}
