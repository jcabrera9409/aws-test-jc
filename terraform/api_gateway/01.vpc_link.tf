resource "aws_apigatewayv2_vpc_link" "this" {
  name               = var.vpc_name
  subnet_ids         = var.vpc_subnets
  security_group_ids = var.vpc_security_groups
  
  tags = var.tags
}

