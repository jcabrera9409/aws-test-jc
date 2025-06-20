variable "name" {
    description = "Nombre del recurso"
}

variable "security_groups" {
    description = "Security Groups"
    type = set(string)
}

variable "subnets" {
    description = "Subnets"
    type = set(string)
}

variable "alb_listener_port" {
    description = "Puerto del listener"
    default = 80
}

variable "alb_listener_protocol" {
    description = "Protocolo del listener"
    default = "HTTP"
}

variable "alb_listener_rule_target_group_arn" {
    description = "ARN del Target Group"
}

variable "alb_listener_rule_condition_path_pattern" {
    description = "Condiciones del Path Pattern"
    type = set(string)
}

variable "tags" {
    description = "Tags"
}