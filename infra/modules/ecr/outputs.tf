output "name" {
  description = "ECR Name"
  value       = aws_ecr_repository.this.name
}

output "trigged_by" {
  description = "Triggers the Docker Push Command"
  value       = null_resource.build_push_dkr_img.triggers
}

output "repository_url" {
  description = "ECR Repository URL"
  value       = aws_ecr_repository.this.repository_url
}