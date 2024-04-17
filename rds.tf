variable "rds_settings" {
  default     = {}
  description = "Necessary setting for PSQL provider"
}

module "postgresql" {
  source                  = "terraform-aws-modules/rds/aws"
  version                 = "~> 6.5"
  vpc_security_group_ids  = [module.rds_security_group.security_group_id]
  db_subnet_group_name    = module.vpc.database_subnet_group_name
  identifier              = var.rds_settings["identifier"]
  family                  = var.rds_settings["family"]
  db_name                 = var.rds_settings["db_name"]
  engine                  = var.rds_settings["engine"]
  engine_version          = var.rds_settings["engine_version"]
  instance_class          = var.rds_settings["instance_class"]
  allocated_storage       = var.rds_settings["allocated_storage"]
  max_allocated_storage   = var.rds_settings["max_allocated_storage"]
  subnet_ids              = module.vpc.database_subnets
  username                = var.rds_settings["username"]
  password                = aws_secretsmanager_secret_version.db_password.secret_string
  multi_az                = var.rds_settings["multi_az"]          #false
  storage_encrypted       = var.rds_settings["storage_encrypted"] #false
  backup_retention_period = var.rds_settings["backup_retention_period"]
  maintenance_window      = var.rds_settings["maintenance_window"]
  backup_window           = var.rds_settings["backup_window"]
  tags = {
    Terraform = "true"
    Owner     = "boon"
  }
}

resource "random_string" "password" {
  length           = 16
  special          = false
  override_special = "!@#$&"
}


resource "aws_secretsmanager_secret" "db_password" {
  name                    = "rds-db-password-0"
  recovery_window_in_days = 0
}

resource "aws_secretsmanager_secret_version" "db_password" {
  secret_id     = aws_secretsmanager_secret.db_password.id
  secret_string = random_string.password.result

}
