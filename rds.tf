module "postgresql" {
  source                = "terraform-aws-modules/rds/aws"
  version               = "~> 4.0"
  identifier            = "boon-rds"
  engine                = "postgres"
  engine_version        = var.postgres_engine_version
  instance_class        = var.postgres_instance_class
  allocated_storage     = var.postgres_allocated_storage
  max_allocated_storage = var.postgres_max_allocated_storage
  subnet_ids            = module.vpc.database.database_subnets.id
  name                  = var.postgres_name
  username              = var.postgres_username
  password              = aws_secretsmanager_secret_version.db_password.secret_string
  multi_az              = var.postgres_multi_az          #false
  storage_encrypted     = var.postgres_storage_encrypted #false
  tags = {
    Terraform = "true"
    Owner     = "boon"
  }
}

resource "aws_secretsmanager_secret" "db_password" {
  name = "rds-db-password"
}

resource "aws_secretsmanager_secret_version" "db_password" {
  secret_id     = aws_secretsmanager_secret.db_password.id
  secret_string = module.db.password
}
