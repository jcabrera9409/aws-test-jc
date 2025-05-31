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

variable "tags" {
    description = "etiquetas"
}