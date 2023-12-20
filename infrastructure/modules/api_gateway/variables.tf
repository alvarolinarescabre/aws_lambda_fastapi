variable "name" {
  description = "API Gateway Name"
  type        = string
  default     = null
}

variable "protocol_type" {
  description = "API Gateway Protocol Type"
  type        = string
  default     = null
}

variable "integration_type" {
  description = "API Gateway Integration Type"
  type        = string
  default     = "AWS_PROXY"
}

variable "connection_type" {
  description = "API Gateway Connection Type"
  type        = string
  default     = "INTERNET"
}

variable "integration_method" {
  description = "API Gateway Integration Method"
  type        = string
  default     = null
}

variable "integration_uri" {
  description = "API Gateway Integration URI"
  type        = string
  default     = null
}

variable "passthrough_behavior" {
  description = "API Gateway Passthrough Behavior"
  type        = string
  default     = "WHEN_NO_MATCH"
}

variable "payload_format_version" {
  description = "API Gateway Payload Format Version"
  type        = string
  default     = "2.0"
}

variable "route_key" {
  description = "API Gateway Route Key"
  type        = string
  default     = null
}

variable "stage_name" {
  description = "API Gateway Stage Name"
  type        = string
  default     = "$default"
}

variable "apis" {
  description = "The APIs Declaration"
  type        = map(any)
  default     = {}
}