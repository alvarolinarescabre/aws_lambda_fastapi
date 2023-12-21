locals {
  ecr_reg = "${data.aws_caller_identity.current.account_id}.dkr.ecr.${data.aws_region.current.name}.amazonaws.com"

  dkr_img_src_sha256 = sha256(join("", [for f in fileset(".", "${var.image_src_path}/**") : filebase64(f)]))

  dkr_upload_cmd = <<-EOT
        aws ecr get-login-password --region ${data.aws_region.current.name} | \
            docker login --username AWS --password-stdin ${local.ecr_reg}

        docker push ${var.image_tag}
    EOT
}