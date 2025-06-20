variable "vpc_name" {
    description = "Nombre del VPC Link"
}

variable "vpc_subnets" {
    description = "Subnets de la VPC"
    type = set(string)
}

variable "vpc_security_groups" {
    description = "Security Groups de la VPC"
    type = set(string)
}

variable "api_name" {
    description = "Nombre de la API Gateway"
}

variable "alb_arn" {
    description = "ARN del Application Load Balancer"
}

variable "tags" {
    description = "Tags"
}