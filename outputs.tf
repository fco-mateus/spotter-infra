output "rds_endpoint" {
  description = "Endpoint do banco RDS"
  value       = aws_db_instance.spotter_db.endpoint
}

output "s3_bucket_name" {
  description = "Nome do bucket S3 criado"
  value       = aws_s3_bucket.spotter_bucket.bucket
}
