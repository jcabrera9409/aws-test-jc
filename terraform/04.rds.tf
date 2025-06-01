
module "rds_mysql" {
  source  = "terraform-aws-modules/rds/aws"
  version = "6.5.3"

  identifier = "${var.project_name}-db"

  engine                = "mysql"
  engine_version        = "8.0.35"
  major_engine_version  = "8.0"
  family                = "mysql8.0"
  instance_class        = var.db_instance_class
  allocated_storage     = var.db_allocated_storage

  db_name  = var.db_name
  username = var.db_username
  password = var.db_password
  port     = var.db_port
  
  vpc_security_group_ids = [module.database_sg.security_group_id]
  subnet_ids             = module.vpc.private_subnets
  create_db_subnet_group = true

  multi_az            = false
  publicly_accessible = false
  skip_final_snapshot = true

  tags = var.tags
}