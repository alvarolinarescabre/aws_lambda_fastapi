module "s3" {
  source = "../../modules/s3"

  bucket = "lambda-fastapi-sources-code-chamo"

  files = {
    lambda_create = {
      "key" : var.lambda_fastapi_zip
      "source" : "${path.root}/zip/${var.lambda_fastapi_zip}"
      "source_hash" : "${path.root}/zip/${var.lambda_fastapi_zip}"
      "content_type" : "application/zip"
    }
  }

  tags = {
    "Name" : "AWS Lambda Sources Code"
  }
}

module "api" {
  source = "../../modules/api_gateway"

  name          = "API Serverless"
  protocol_type = "HTTP"

  apis = {
    create = {
      integration_type       = "AWS_PROXY"
      connection_type        = "INTERNET"
      integration_method     = "POST"
      integration_uri        = module.lambda_fastapi.invoke_arn
      passthrough_behavior   = "WHEN_NO_MATCH"
      payload_format_version = "2.0"
      route_key              = "GET /"
    }
  }

}

module "lambda_fastapi" {
  source = "../../modules/lambda"

  function_name = "lambda_create"
  s3_bucket     = module.s3.s3_bucket
  s3_key        = var.lambda_fastapi_zip
  handler       = "main.lambda_handler"
  runtime       = "python3.10"
  policy_name   = "lambda_create_policy"
  role_name     = "lambda_create_role"
  permissions = {
    index = {
      action     = "lambda:InvokeFunction"
      principal  = "apigateway.amazonaws.com"
      source_arn = "${module.api.execution_arn}/*/GET/"
    }
  }
}
