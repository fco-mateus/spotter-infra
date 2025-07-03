output "rds_endpoint" {
  description = "Endpoint do banco RDS"
  value       = module.rds.db_endpoint
}

output "s3_bucket_name" {
  description = "Nome do bucket S3 criado"
  value       = module.s3_bucket.bucket_name
}

output "s3_bucket_arn" {
  description = "ARN do Bucket S3 criado"
  value       = module.s3_bucket.bucket_arn
}

output "alb_dns_name" {
  description = "DNS público do Load Balancer"
  value       = module.ecs_cluster.alb_dns_name
}
