variable "name" {
    description = "Nombre del recurso"
}

variable "description" {
    description = "Descripcion del recurso"
}

variable "image_id" {
    description = "AMI que se usara"
}

variable "instance_type" {
    description = "Tipo de instancia"
}

variable "security_groups" {
    description = "IDs de Security Groups"
    type = set(string)
}

variable "iam_profile" {
    description = "ARN del Perfil IAM"
}

variable "user_data" {
    description = "Filebase64 User Data"
}

variable "tags" {
    description = "Tags del recurso"
    type = map(string)
}