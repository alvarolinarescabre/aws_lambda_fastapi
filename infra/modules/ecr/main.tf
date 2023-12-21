resource "aws_ecr_repository" "this" {
  name         = var.name
  force_delete = var.force_delete

  image_scanning_configuration {
    scan_on_push = var.scan_on_push
  }
}


resource "null_resource" "build_push_dkr_img" {
  triggers = {
    detect_docker_source_changes = var.force_image_rebuild == true ? timestamp() : local.dkr_img_src_sha256
  }
  provisioner "local-exec" {
    command = local.dkr_upload_cmd
  }
}