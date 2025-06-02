variable "name" {
    description = "Nombre del Target Group"
}

variable "target_type" {
    description = "Tipo de Target Group"
}

variable "vpc_identifier" {
    description = "ID de la VPC"
}

variable "port" {
    description = "Puerto"
    default = 80
}

variable "protocol" {
    description = "Protocol"
    default = "HTTP"
}

variable "health_check_interval_seconds" {
    description = "Health Check Interval in seconds"
    default = 30
}

variable "health_check_timeout_seconds" {
    description = "Health Check TimeOut in Seconds"
    default = 10
}

variable "healthy_threshold_count" {
    description = "Healthy threshold count"
    default = 3
}

variable "unhealthy_threshold_count" {
    description = "Unhealthy threshold count"
    default = 2   
}

variable "matcher_code" {
    description = "Http Code usado para validar que la respuesta fue correcta"
    default = "200-299"
}

variable "health_check_path" {
    description = "Path usado para el health check"
}

variable "tags" {
    description = "Tags"
}