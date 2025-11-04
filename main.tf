provider "aws" {
  region = var.region
}

resource "random_id" "suffix" {
  byte_length = 4
}

resource "aws_s3_bucket" "lab_bucket" {
  bucket = "lab-terraform-ci-${var.id4}-${random_id.suffix.hex}"
  acl    = "private"

  lifecycle_rule {
    id      = "expire-objects"
    enabled = true
    expiration {
      days = 7
    }
  }

  tags = {
    Project = "Lab9-Terraform-CI"
  }
}
