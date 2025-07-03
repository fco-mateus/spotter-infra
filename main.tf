provider "aws" {
  region = var.aws_region
}

module "s3_bucket" {
  source = "./modules/s3_bucket"
}

module "rds" {
  source                = "./modules/rds"
  db_username           = var.db_username
  db_password           = var.db_password
  allowed_cidr_blocks   = var.allowed_cidr_blocks_db
  ecs_security_group_id = module.ecs_cluster.security_group_id
}

module "ecs_cluster" {
  source = "./modules/ecs"
  vpc_id         = var.vpc_id
  subnet_id      = var.ecs_backend_subnet_id
  alb_public_subnets_ids = var.alb_public_subnets_ids
  db_endpoint = module.rds.db_endpoint
  db_password = var.db_password
  bucket_name = module.s3_bucket.bucket_name
}
