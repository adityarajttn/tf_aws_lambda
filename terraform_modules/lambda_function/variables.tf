variable "ecr_repository_name" {
  type = string
  description = "ECR repository name"
}

variable "docker_image_tag" {
  type = string
  description = "Docker Image Tag"
}

variable "lambda_function_name" {
  type = string
  default = "aws_lambda_cicd"
  description = "Lambda function name"
}

variable "iam_policy_name" {
  type = string
  default = "lambda_basic_execution_policy"
  description = "IAM Policy name"
}

variable "iam_role_name" {
  type = string
  default = "aws_lambda_cicd_role"
}