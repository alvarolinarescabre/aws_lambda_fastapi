# Enable Remote S3 TFState
#module "s3_tfstate" {
#  source = "../../modules/s3"
#
#  bucket          = "lambda-fastapi-terraform-state-backend"
#
#  custom_tag = {
#    "Name" : "AWS Lambda FastAPI Terraform TFState"
#  }
#}
#
#module "dynamodb" {
#  source = "../../modules/dynamodb"
#
#  name           = "terraform_state"
#  read_capacity  = 5
#  write_capacity = 5
#  hash_key       = "LockID"
#
#  attributes = {
#    id = {
#      name = "LockID"
#      type = "S"
#    }
#  }
#
#  tags = {
#    "Name" = "DynamoDB Terraform State Lock Table"
#  }
#}

# Deploy the Solution
module "docker_image" {
  source = "../../modules/docker"

  providers = {
    docker = docker
  }

  name     = var.image_name
  context  = "../../../app/"
  tag      = "${local.ecr_reg}/${var.image_name}:${var.tag}"
  platform = var.platform
}

module "ecr" {
  source = "../../modules/ecr"

  name                = module.docker_image.name
  ecr_reg             = local.ecr_reg
  image_name          = module.docker_image.name
  image_tag           = module.docker_image.tag[0][0]
  image_src_path      = module.docker_image.context[0]
  force_delete        = true
  scan_on_push        = true
  force_image_rebuild = true
}

module "api" {
  source = "../../modules/api_gateway"

  aws_function_name = var.aws_function_name
  uri               = module.lambda_fastapi.invoke_arn
  api_stage         = "dev"
}

module "lambda_fastapi" {
  source = "../../modules/lambda"

  function_name    = var.aws_function_name
  image_uri        = "${module.ecr.repository_url}:${var.tag}"
  source_code_hash = base64sha256(trimprefix(data.aws_ecr_image.lambda_fastapi.id, "sha256:"))
  memory_size      = 256
  policy_name      = "lambda_fastapi_policy"
  role_name        = "lambda_fastapi_role"

  lambda_runtime_environment_variables = {
    API_STAGE = "dev"
  }

  depends_on = [
    module.docker_image,
    module.ecr
  ]
}
