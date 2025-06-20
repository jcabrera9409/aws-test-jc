resource "aws_launch_template" "this" {
    name = var.name
    description = var.description

    image_id = var.image_id
    instance_type = var.instance_type

    vpc_security_group_ids = var.security_groups

    iam_instance_profile {
        arn = var.iam_profile
    }

    user_data = var.user_data
    update_default_version = true

    tags = var.tags
}