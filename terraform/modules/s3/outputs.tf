# ===============-========================
# BACKEND BUCKET
output "backend_s3_arn" {
  value       = aws_s3_bucket.backend.arn
  description = "the arn of the S3 bucket"
}

output "backend_s3_id" {
  value       = aws_s3_bucket.backend.id
  description = "the id of the S3 bucket"
}

output "backend_s3_bucket_name" {
  value       = aws_s3_bucket.backend.bucket
  description = "the id of the S3 bucket"
}
# BACKEND BUCKET
# ===============-========================

# ===============-========================
# CLOUDFRONT BUCKET
output "cloudfront_s3_arn" {
  value       = aws_s3_bucket.cloudfront.arn
  description = "the arn of the S3 bucket"
}

output "cloudfront_s3_id" {
  value       = aws_s3_bucket.cloudfront.id
  description = "the id of the S3 bucket"
}

output "cloudfront_s3_bucket_name" {
  value       = aws_s3_bucket.cloudfront.bucket
  description = "the id of the S3 bucket"
}

output "cloudfront_s3_domain_name" {
  value       = aws_s3_bucket.cloudfront.bucket_regional_domain_name
  description = "the id of the S3 bucket"
}
# CLOUDFRONT BUCKET
# ===============-========================