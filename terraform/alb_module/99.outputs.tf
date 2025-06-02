output "alb_id" {
    value = aws_lb.this.id
}

output "alb_arn" {
    value = aws_lb.this.arn
}

output "alb_listener_arn" {
    value = aws_lb_listener.http.arn
}