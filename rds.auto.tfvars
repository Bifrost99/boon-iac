variable "postgres_engine_version" {
  description = "Enginer version for postgresql"
  default     = "13.3"
}

variable "postgres_instance_classe" {
  description = "Instance class for rds instance"
  default     = "db.t2.micro"
}

variable "postgres_allocated_storage" {
  description = "Allocated storage for postgres"
  default     = "20"
}

variable "postgres_max_allocated_storage" {
  description = "Maximum allocated storage for postgres"
  default     = "2000"
}

variable "postgres_name" {
  description = "Name of db instance"
  default     = "boon"
}

variable "postgres_username" {
  description = "Username of db instance"
  default     = "boon"
}

variable "postgres_multi_az " {
  description = "Multi az for postgres"
  type        = bool
  default     = false
}

variable "postgres_storage_encrypted" {
  description = "storage encription for postgres"
  type        = bool
  default     = false
}
