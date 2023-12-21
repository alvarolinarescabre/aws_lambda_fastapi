output "base_url" {
  description = "API Gateway Base URL"
  value       = aws_api_gateway_deployment.this.invoke_url
}
