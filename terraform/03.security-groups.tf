module "apigateway_sg" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "5.1.0"

  name        = "${var.project_name}-apigateway-sg"
  description = "Permitir trafico http desde internet"
  vpc_id      = module.vpc.vpc_id 

  ingress_rules = ["http-80-tcp"]
  ingress_cidr_blocks = ["0.0.0.0/0"]

  egress_rules = ["all-all"]

  tags = var.tags
}

module "balancer_sg" {
  source = "terraform-aws-modules/security-group/aws"
  version = "5.1.0"

  name = "${var.project_name}-balancer-sg"
  description = "Permitir trafico http desde el SG APIGateway"
  vpc_id = module.vpc.vpc_id

  ingress_with_source_security_group_id = [
    {
      from_port                 = 80
      to_port                   = 80
      protocol                  = "tcp"
      description               = "Permitir HTTP desde APIGateway SG"
      source_security_group_id  = module.apigateway_sg.security_group_id
    }
  ]

  egress_rules = ["all-all"]
  tags = var.tags
}

module "application_sg" {
  source = "terraform-aws-modules/security-group/aws"
  version = "5.1.0"

  name = "${var.project_name}-application-sg"
  description = "Permitir http desde balancer y trafico interno TCP"
  vpc_id = module.vpc.vpc_id

  ingress_with_source_security_group_id = [
    {
      from_port                = 80
      to_port                  = 80
      protocol                 = "tcp"
      description              = "HTTP desde balancer"
      source_security_group_id = module.balancer_sg.security_group_id
    }
  ]

  ingress_with_self = [
    {
      from_port   = 0
      to_port     = 65535
      protocol    = "tcp"
      description = "Trafico interno entre recursos del mismo SG"
    }
  ]

  egress_rules = ["all-all"]
  tags = var.tags
}

module "database_sg" {
  source = "terraform-aws-modules/security-group/aws"
  version = "5.1.0"

  name = "${var.project_name}-database-sg"
  description = "Permitir trafico 3306 desde el SG Application"
  vpc_id = module.vpc.vpc_id

  ingress_with_source_security_group_id = [
    {
      from_port                 = 3306
      to_port                   = 3306
      protocol                  = "tcp"
      description               = "Permitir 3306 TCP desde Application SG"
      source_security_group_id  = module.application_sg.security_group_id
    }
  ]

  egress_rules = ["all-all"]
  tags = var.tags
}