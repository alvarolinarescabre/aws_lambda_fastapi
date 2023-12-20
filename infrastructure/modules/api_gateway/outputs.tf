output "execution_arn" {
  description = "API Gateway Execution ARN"
  value       = aws_apigatewayv2_api.this.execution_arn
}

output "api_endpoint" {
  description = "Test API endpoint with this address"
  value       = aws_apigatewayv2_api.this.api_endpoint
}