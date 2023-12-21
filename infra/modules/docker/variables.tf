variable "name" {
  description = "Docker Image Name"
  type        = string
  default     = null
}

variable "force_remove" {
  description = "Docker If true, then the image is removed forcibly when the resource is destroyed."
  type        = bool
  default     = false
}

variable "keep_locally" {
  description = "Docker If true, then the Docker image won't be deleted on destroy operation. If this is false, it will delete the image from the docker local storage on destroy operation."
  type        = bool
  default     = true
}

variable "context" {
  description = "Docker Context Path Build"
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
