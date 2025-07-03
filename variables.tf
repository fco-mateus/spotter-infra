variable "db_username" {
  description = "Username for the RDS instance"
  type        = string
  default     = "postgres"
}

variable "db_password" {
  description = "Password for the RDS instance"
  type        = string
  sensitive   = true
}

variable "aws_region" {
  description = "AWS Region"
  type        = string
  default     = "us-east-1"
}

variable "allowed_cidr_blocks_db" {
  description = "IPs allowed to connect on RDS"
  type        = list(string)
  default     = ["255.255.255.255/32"]
}

variable "vpc_id" {
  description = "VPC do Projeto"
  type        = string
}

variable "ecs_backend_subnet_id" {
  description = "ID da subnet do cluster ECS (back-end)"
  type        = string
}

variable "alb_public_subnets_ids" {
  description = "Subnets IDs for ALB"
  type = list(string)
  default = []
}