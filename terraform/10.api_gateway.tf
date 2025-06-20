module "api-gateway" {
    source = "./api_gateway"

    vpc_name = "${var.project_name}-vpc"
    api_name = "${var.project_name}-api-http"

    vpc_security_groups = [module.apigateway_sg.security_group_id]
    vpc_subnets = module.vpc.public_subnets
    alb_arn = module.alb.alb_arn

    tags = var.tags
}
