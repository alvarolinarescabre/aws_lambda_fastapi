variable "name" {
  description = "Repo Name"
  type        = string
  default     = null
}

variable "ecr_reg" {
  description = "ECR Repo URL"
  type        = string
  default     = null
}

variable "image_name" {
  description = "Docker Image Name"
  type        = string
  default     = null
}

variable "image_tag" {
  description = "Docker Tag Build"
  type        = string
  default     = null
}

variable "image_src_path" {
  description = "Docker Image Sources Path"
  type        = string
  default     = null
}

variable "force_delete" {
  description = "Force Delete Repo"
  type        = bool
  default     = false
}

variable "scan_on_push" {
  description = "Scan Vulnerability on Push"
  type        = bool
  default     = true
}

variable "force_image_rebuild" {
  description = "Force Image Build"
  type        = bool
  default     = false
}