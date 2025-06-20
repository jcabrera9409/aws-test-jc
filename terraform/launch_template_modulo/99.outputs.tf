output "launch_template_default_version" {
    description = "Default version del template generado"
    value = aws_launch_template.this.default_version
}

output "launch_template_id" {
    description = "ID del template generado"
    value = aws_launch_template.this.id
}