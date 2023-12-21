output "s3_bucket" {
  description = "S3 Bucket Name"
  value       = aws_s3_bucket.this.bucket
}
