provider "aws" {
  region = var.aws_region
}

resource "aws_s3_bucket" "spotter_bucket" {
  bucket        = "spotter-bucket-${random_integer.suffix.result}"
  force_destroy = true
}

resource "random_integer" "suffix" {
  min = 1000
  max = 9999
}

# Habilitar ACLs no bucket
resource "aws_s3_bucket_ownership_controls" "bucket_acl_control" {
  bucket = aws_s3_bucket.spotter_bucket.id

  rule {
    object_ownership = "ObjectWriter" # Permite ACLs
  }
}

# Desbloquear acesso público ao bucket
resource "aws_s3_bucket_public_access_block" "bucket_public_access" {
  bucket = aws_s3_bucket.spotter_bucket.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

# Política pública de leitura
resource "aws_s3_bucket_policy" "bucket_public_policy" {
  bucket = aws_s3_bucket.spotter_bucket.id

  depends_on = [
    aws_s3_bucket_public_access_block.bucket_public_access
  ]

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid       = "AllowPublicRead"
        Effect    = "Allow"
        Principal = "*"
        Action    = "s3:GetObject"
        Resource  = "${aws_s3_bucket.spotter_bucket.arn}/*"
      }
    ]
  })
}

resource "aws_security_group" "rds_sg" {
  name        = "rds-spotter-sg"
  description = "Allow PostgreSQL access"

  ingress {
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Configure com o seu IP!
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_db_instance" "spotter_db" {
  allocated_storage      = 20
  storage_type           = "gp2"
  engine                 = "postgres"
  engine_version         = "17.4"
  instance_class         = "db.t3.micro" # Free Tier
  db_name                = "spotterdb"
  username               = var.db_username
  password               = var.db_password
  publicly_accessible    = true
  skip_final_snapshot    = true
  vpc_security_group_ids = [aws_security_group.rds_sg.id]
}
