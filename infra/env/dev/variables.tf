variable "image_name" {
  description = "Docker Image Name"
  type        = string
  default     = null
}

variable "tag" {
  description = "Docker Tag Build"
  type        = string
  default     = null
}


variable "platform" {
  description = "Docker Platform Build"
  type        = string
  default     = null
}

variable "aws_function_name" {
  description = "Lambda Function Name"
  type        = string
  default     = null
}