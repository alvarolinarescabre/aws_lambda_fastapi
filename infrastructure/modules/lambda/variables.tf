variable "function_name" {
  description = "Lambda Function Name"
  type        = string
  default     = null
}

variable "s3_bucket" {
  description = "Lambda Source Code S3 Bucket"
  type        = string
  default     = null
}

variable "s3_key" {
  description = "Lambda Source Code S3 Key"
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