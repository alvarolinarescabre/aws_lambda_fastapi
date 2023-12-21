data "aws_caller_identity" "current" {}

data "aws_region" "current" {}

data "aws_ecr_image" "lambda_fastapi" {
  repository_name = module.ecr.name
  most_recent     = true
  depends_on = [
    module.docker_image,
    module.ecr
  ]
}