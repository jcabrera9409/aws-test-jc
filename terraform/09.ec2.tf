data "template_file" "otel_user_data" {
    template = file("${path.module}${var.otel_user_data}")
    
    vars = {
        ip_private_prometheus = module.prometheus.private_ip
    }
}

module "mysql" {
    source  = "terraform-aws-modules/ec2-instance/aws"
    name = "${var.project_name}-mysql"

    create = !var.db_create

    ami                     = var.ec2_ami_default
    instance_type           = var.ec2_instance_type_default
    iam_instance_profile    = var.iam_profile_name
    vpc_security_group_ids  = [module.application_sg.security_group_id]
    subnet_id               = module.vpc.private_subnets[0]

    user_data = filebase64("${path.module}${var.mysql_user_data}")

    tags = var.tags
}

module "prometheus" {
    source  = "terraform-aws-modules/ec2-instance/aws"
    name = "${var.project_name}-prometheus"

    ami                     = var.ec2_ami_default
    instance_type           = var.ec2_instance_type_default
    iam_instance_profile    = var.iam_profile_name
    vpc_security_group_ids  = [module.application_sg.security_group_id]
    subnet_id               = module.vpc.private_subnets[0]

    user_data = filebase64("${path.module}${var.prometheus_user_data}")

    tags = var.tags
}

module "otel" {
    source  = "terraform-aws-modules/ec2-instance/aws"
    name = "${var.project_name}-otel"

    ami                     = var.ec2_ami_default
    instance_type           = var.ec2_instance_type_default
    iam_instance_profile    = var.iam_profile_name
    vpc_security_group_ids  = [module.application_sg.security_group_id]
    subnet_id               = module.vpc.private_subnets[0]

    user_data_base64 = base64encode(data.template_file.otel_user_data.rendered)

    tags = var.tags
}

module "grafana" {
    source  = "terraform-aws-modules/ec2-instance/aws"
    name = "${var.project_name}-grafana"

    ami                     = var.ec2_ami_default
    instance_type           = var.ec2_instance_type_default
    iam_instance_profile    = var.iam_profile_name
    vpc_security_group_ids  = [module.application_sg.security_group_id, module.apigateway_sg.security_group_id]
    subnet_id               = module.vpc.public_subnets[0]

    user_data = filebase64("${path.module}${var.grafana_user_data}")

    tags = var.tags
}