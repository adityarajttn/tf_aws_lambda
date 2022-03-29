variable "region" {
  type = string
  default = "us-east-1"
  description = "AWS Reason"
}

variable "s3_bucket_name" {
  type = string
  default = "tf-cicd-s3-bucket"
  description = "S3 bucket name for remote state"
}

variable "s3_key_name" {
  type = string
  default = "terraform/terraform.tfstate"
  description = "S3 bucket name for remote state"
}

variable "dynamodb_table_name" {
  type = string
  default = "tf-state-locking"
  description = "DynamoDB Table Name"
}

variable "repository_name" {
  type = string
  description = "ECR repository name"
}

variable "image_tag" {
  type = string
  description = "Docker Image Tag"
}