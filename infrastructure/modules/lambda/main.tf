resource "aws_lambda_function" "this" {
  function_name = var.function_name

  s3_bucket = var.s3_bucket
  s3_key    = var.s3_key

  handler = var.handler
  runtime = var.runtime

  role = aws_iam_role.this.arn
}

resource "aws_iam_role_policy" "this" {
  name = var.policy_name
  role = aws_iam_role.this.id

  policy = data.aws_iam_policy_document.this.json
}

resource "aws_iam_role" "this" {
  name = var.role_name

  assume_role_policy = <<-EOT
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Effect": "Allow"
    }
  ]
}
EOT
}

resource "aws_lambda_permission" "this" {
  for_each      = var.permissions
  action        = each.value.action
  function_name = aws_lambda_function.this.function_name
  principal     = each.value.principal
  source_arn    = each.value.source_arn
}