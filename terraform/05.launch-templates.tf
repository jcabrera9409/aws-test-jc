module "launch_template_backend" {
    source = "./launch_template_modulo"
    
    name = "${var.project_name}-template"
    description = "Launch Template para Backend"
    
    image_id = var.lt_image_id
    instance_type = var.lt_instance_type

    security_groups = [module.application_sg.security_group_id]
    iam_profile = var.lt_iam_profile
    user_data = filebase64("${path.module}${var.lt_user_data}")
    tags = var.tags
}