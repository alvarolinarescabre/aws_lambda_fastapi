variable "bucket" {
  description = "AWS S3 Bucket Name"
  type        = string
  default     = null
}

variable "force_destroy" {
  description = "AWS S3 Force Destroy the Bucket"
  type        = bool
  default     = false
}

variable "custom_tag" {
  description = "AWS S3 Custom Tag"
  type        = map(any)
  default     = {}
}

variable "status" {
  description = "AWS S3 Versioning Status"
  type        = string
  default     = "Enabled"
}

variable "files" {
  description = "AWS S3 Objects to Upload"
  type        = map(any)
  default     = {}
}

variable "block_public_acls" {
  description = "AWS S3 Block Public ACLs"
  type        = bool
  default     = true
}

variable "block_public_policy" {
  description = "AWS S3 Block Public Policy"
  type        = bool
  default     = true
}

variable "ignore_public_acls" {
  description = "AWS S3 Ignore Public ACLs"
  type        = bool
  default     = true
}

variable "restrict_public_buckets" {
  description = "AWS S3 Restrict Public Buckets"
  type        = bool
  default     = true
}