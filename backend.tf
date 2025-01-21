# backend.tf
terraform {
    backend "s3" {
        bucket = "ruka-terraform-state"
        key = "terraform/state"
        region = "us-east-1"
        dynamodb_talbe = "terraform-lock"
    }
}