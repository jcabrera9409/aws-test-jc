resource "aws_lb_listener_rule" "alumnos_rule" {
  listener_arn = aws_lb_listener.http.arn
  priority     = 100

  action {
    type             = "forward"
    target_group_arn = var.alb_listener_rule_target_group_arn
  }

  condition {
    path_pattern {
      values = var.alb_listener_rule_condition_path_pattern
    }
  }
  
  tags = var.tags
}