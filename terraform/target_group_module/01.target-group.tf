resource "aws_lb_target_group" "this" {
    name = var.name
    port = var.port
    protocol = var.protocol
    vpc_id = var.vpc_identifier

    target_type = var.target_type

    health_check {
        path = var.health_check_path
        interval = var.health_check_interval_seconds
        timeout = var.health_check_timeout_seconds
        healthy_threshold = var.healthy_threshold_count
        unhealthy_threshold = var.unhealthy_threshold_count
        matcher = var.matcher_code
    }

    tags = var.tags
}