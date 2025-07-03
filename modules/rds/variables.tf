variable "db_username" {
  type = string
}

variable "db_password" {
  type = string
}

variable "allowed_cidr_blocks" {
   description = "IPs allowed to connect on RDS"
  type    = list(string)
  default = ["255.255.255.255/32"]
}

variable "ecs_security_group_id" {
  type = string
}
