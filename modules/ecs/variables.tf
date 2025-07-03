variable "vpc_id" {
  type = string
}

variable "subnet_id" {
  type = string
}

variable "frontend_image" {
  type = string
  default = "ttuca123/spotterfront:v1.0.0"
}

variable "backend_image" {
  type = string
  default = "fcomateus1/spotter-backend:v1.3.2"
}

variable "ocr_image" {
  type = string
  default = "endmrf/ocr-license-plates:v1.3.0"
}

variable "alb_public_subnets_ids" {
  description = "Public subnets IDs for ALB"
  type = list(string)
  default = []
}

variable "db_endpoint" {
  type = string
}

variable "db_password" {
  type = string
}

variable "bucket_name" {
  type = string
}
