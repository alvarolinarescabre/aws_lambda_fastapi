variable "aws_function_name" {
  description = "The name of the Lambda function."
  type        = string
}

variable "api_stage" {
  description = "The stage to use when deploying the API gateway resources."
  type        = string
}

variable "uri" {
  description = "The Lambda URI function"
  type        = string
}