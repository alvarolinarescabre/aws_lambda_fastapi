variable "function_name" {
  description = "Lambda Function Name"
  type        = string
  default     = null
}

variable "image_uri" {
  description = "Lambda Container Image URI"
  type        = string
  default     = null
}

variable "handler" {
  description = "Lambda Handler"
  type        = string
  default     = null
}

variable "runtime" {
  description = "Lambda Runtime"
  type        = string
  default     = null
}

variable "source_code_hash" {
  description = "Lambda Source Code Hash"
  type        = string
  default     = null
}

variable "timeout" {
  description = "Lambda Timeout"
  type        = number
  default     = 900
}

variable "memory_size" {
  description = "Lambda Memory Size"
  type        = number
  default     = 128
}

variable "lambda_runtime_environment_variables" {
  description = "The runtime environment variables to include in the Lambda"
  type        = map(any)
  default     = { "foo" : "bar" }
}

variable "policy_name" {
  description = "Lambda Policy Name"
  type        = string
  default     = null
}

variable "role_name" {
  description = "Lambda Role Name"
  type        = string
  default     = null
}

variable "permissions" {
  description = "Lambda Permissions"
  type        = map(any)
  default     = {}
}