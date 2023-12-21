resource "docker_image" "this" {
  name         = var.name
  force_remove = var.force_remove
  keep_locally = var.keep_locally

  build {
    context  = var.context
    tag      = [var.tag]
    platform = var.platform
  }
}