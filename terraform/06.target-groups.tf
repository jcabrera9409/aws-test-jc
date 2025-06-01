module "target_group" {
    source = "./target_group"
    
    name = "${var.project_name}-tg"
    target_type = var.tg_target_type

    vpc_identifier = module.vpc.vpc_id
    health_check_path = var.tg_health_path

    tags = var.tags
}