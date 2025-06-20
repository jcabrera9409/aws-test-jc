module "alb" {
    source = "./alb_module"

    name = "${var.project_name}-alb"
    
    subnets = module.vpc.private_subnets
    security_groups = [module.balancer_sg.security_group_id]

    alb_listener_rule_target_group_arn = module.target_group.target_group_arn
    alb_listener_rule_condition_path_pattern = ["/v1/alumnos*"]
    
    tags = var.tags
}