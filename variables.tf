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
  default     = "us-east-2"
}

variable "allowed_cidr_blocks_db" {
  description = "Allowed CIDRs to connect on RDS"
  type = list(string)
}