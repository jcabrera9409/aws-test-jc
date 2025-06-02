data "template_file" "backend_user_data" {
    template = file("${path.module}/user_data/backend_user_data.config.sh")
    
    vars = {
        ip_private_mysql = module.mysql.private_ip
        ip_private_otel = module.otel.private_ip
    }
}

module "launch_template_backend" {
    source = "./launch_template_modulo"
    
    name = "${var.project_name}-template"
    description = "Launch Template para Backend"
    
    image_id = var.lt_image_id
    instance_type = var.lt_instance_type

    security_groups = [module.application_sg.security_group_id]
    iam_profile = var.lt_iam_profile

    user_data = base64encode(data.template_file.backend_user_data.rendered)
    
    tags = var.tags
}