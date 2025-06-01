module "auto_scaling_group" {
    source = "terraform-aws-modules/autoscaling/aws"
    version = "7.0.0"

    name = "${var.project_name}-asg"
    min_size = 2
    max_size = 4
    desired_capacity = 2

    vpc_zone_identifier = module.vpc.public_subnets

    launch_template_id = module.launch_template_backend.launch_template_id
    launch_template_version = module.launch_template_backend.launch_template_default_version
    create_launch_template = false

    target_group_arns = [module.target_group.target_group_arn]

    security_groups = [module.application_sg.security_group_id]

    tags = var.tags
}
