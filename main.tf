#provider.aws
provider "aws" {
    region = var.region
}

#remote_state.s3
terraform {
  backend "s3" {
    bucket = "tf-cicd-s3-bucket"
    key    = "terraform/terraform.tfstate"
    region = "us-east-1"
    dynamodb_table = "tf-state-locking"
  }
}

#module.lambda_function
module "lambda_function" {
  source = "./terraform_modules/lambda_function"
  ecr_repository_name = var.repository_name
  docker_image_tag = var.image_tag
}


