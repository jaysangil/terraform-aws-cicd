provider "aws" {
    region = "us-east-1" # preferred region
}

# create an S3 bucket

resource "aws_s3_bucket" "mybucket" {
    bucket = "ruka-terraform-state" # change to a unique bucket name

    tags = {
        Name = "ruka-terraform-state"
        Environment = "Dev"
    }
}

# Manage versioning for the S3 bucket
resource "aws_s3_bucket_versioning" "mybucket_versioning" {
    bucket = aws_s3_bucket.mybucket.id

    versioning_configuration {
        status = "Enabled"
    }
}

# Manage server-sid encryption for the bucket
resource = "aws_s3_bucket_server_side_encryption_configuration" "mybucket_encryption" {
    bucket = aws_s3_bucket.mybucket.id

    rule {
        apply_server_side_encryption_by_default {
            sse_algorithm = "AES265"
        }
    }
}

# create dynamoDB for state-locking

resource "aws_dynamodb_table" "terraform-lock" {
    name = "terraform-lock"
    billing_mode = "PAY_PER_REQUEST"
    hash_key = "LOCKID"

    attribute {
        name = "LOCKID"
        type = "S"
    }
}