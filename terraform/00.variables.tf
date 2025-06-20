variable "region" {
    description = "Región a usar"
}

variable "project_name" {
    description = "Nombre del proyecto terraform"
}

variable "iam_profile_name" {
    description = "Nombre del IAM Profile por defecto"
}

variable "ec2_ami_default" {
    description = "AMI de EC2 por defecto"
}

variable "ec2_instance_type_default" {
    description = "Tipo de instancia de ECW por defecto"
}

variable "vpc_cidr" {
    description = "Rango de IPs"
}

variable "vpc_azs" {
    description = "Zonas de disponibilidad"
}

variable "vpc_public_subnets" {
    description = "subredes publicas del proyecto"
}

variable "vpc_private_subnets" {
    description = "subredes privadas del proyecto"
}

variable "vpc_enable_nat_gateway" {
  description = "habilitar nat gateway para redes privadas"
}

variable "db_create" {
    description = "Usar true si se desea crear una base de datos RDS"
    default = false
}

variable "db_instance_class" {
    description = "Tipo de instancia de base de datos"
}

variable "db_allocated_storage" {
    description = "Espacio en GB de la base de datos"
}

variable "db_name" {
    description = "Nombre de la base de datos"
}

variable "db_username" {
    description = "Usuario de la base de datos"
}

variable "db_password" {
    description = "Password de la base de datos"
}

variable "db_port" {
    description = "Puerto de la base de datos"
    default = 3306
}

variable "lt_image_id" {
    description = "Id de la imagen que usará el launch template"
}

variable "lt_instance_type" {
    description = "Instance type del launch template"
}

variable "lt_iam_profile" {
    description = "IAM Profile para administrar las instancias generadas con el template"
}

variable "lt_user_data" {
    description = "Scripts a ejecutar en las maquinas del launche template"  
}

variable "tg_target_type" {
    description = "Tipo de Target Group"
}

variable "tg_health_path" {
    description = "Ruta que se usará para realizar health check"
}

variable "mysql_user_data" {
    description = "Scripts a ejecutar para levantar un EC2 con MySQL"
}

variable "prometheus_user_data" {
    description = "Scripts a ejecutar para levantar un EC2 con Prometheus"
}

variable "otel_user_data" {
    description = "Scripts a ejecutar para levantar un EC2 con Open Telemetry"
}

variable "grafana_user_data" {
    description = "Scripts a ejecutar para levanar un EC2 con Grafana"
}

variable "tags" {
    description = "etiquetas"
}