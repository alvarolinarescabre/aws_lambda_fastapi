output "name" {
  description = "Docker Image Name"
  value       = docker_image.this.name
}

output "tag" {
  description = "Docker Image Tag"
  value       = docker_image.this.build.*.tag
}

output "context" {
  description = "Docker Image Context"
  value       = docker_image.this.build.*.context
}