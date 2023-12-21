variable "name" {
  description = "DynamoDB Name"
  type        = string
  default     = null
}

variable "billing_mode" {
  description = "DynamoDB Billing Mode"
  type        = string
  default     = "PROVISIONED"
}

variable "read_capacity" {
  description = "DynamoDB Read Capacity"
  type        = number
  default     = 5
}

variable "write_capacity" {
  description = "DynamoDB Write Capacity"
  type        = number
  default     = 5
}

variable "hash_key" {
  description = "DynamoDB Hash Key"
  type        = string
  default     = null
}

variable "attributes" {
  description = "DynamoDB Attributes"
  type        = map(any)
  default     = {}
}