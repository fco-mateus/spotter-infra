output "bucket_name" {
  value = aws_s3_bucket.spotter_bucket.bucket
}

output "bucket_arn" {
  value = aws_s3_bucket.spotter_bucket.arn
}
