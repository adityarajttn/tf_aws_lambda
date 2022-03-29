# aws_ecr_repository.ecr_repository:
data "aws_ecr_repository" "ecr_repository" {
  name = var.ecr_repository_name
}

# aws_ecr_image.image_digest:
data "aws_ecr_image" "image_digest" {
  repository_name = "aws_lambda_cicd"
  image_tag       = "${var.docker_image_tag}"
}

# aws_lambda_function.aws_lambda_cicd:
resource "aws_lambda_function" "aws_lambda_cicd" {
    function_name                  = var.lambda_function_name
    image_uri                      = "${data.aws_ecr_repository.ecr_repository.repository_url}@${data.aws_ecr_image.image_digest.image_digest}"
    package_type                   = "Image"
    role                           = aws_iam_role.iam_lambda_role.arn
    tags                           = {}
    tags_all                       = {}
    timeout                        = 30
    memory_size                    = 1024

}