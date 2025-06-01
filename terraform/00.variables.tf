variable "region" {
    description = "Región a usar"
}

variable "project_name" {
    description = "Nombre del proyecto terraform"
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

variable "tags" {
    description = "etiquetas"
}