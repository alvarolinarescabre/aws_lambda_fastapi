resource "aws_apigatewayv2_api" "this" {
  name          = var.name
  protocol_type = var.protocol_type
}

resource "aws_apigatewayv2_integration" "this" {
  for_each               = var.apis
  api_id                 = aws_apigatewayv2_api.this.id
  integration_type       = each.value.integration_type
  connection_type        = each.value.connection_type
  integration_method     = each.value.integration_method
  integration_uri        = each.value.integration_uri
  passthrough_behavior   = each.value.passthrough_behavior
  payload_format_version = each.value.payload_format_version
}

resource "aws_apigatewayv2_route" "this" {
  for_each  = var.apis
  api_id    = aws_apigatewayv2_api.this.id
  route_key = each.value.route_key
  target    = "integrations/${aws_apigatewayv2_integration.this[each.key].id}"
}

resource "aws_apigatewayv2_stage" "this" {
  api_id      = aws_apigatewayv2_api.this.id
  auto_deploy = true
  name        = var.stage_name
}