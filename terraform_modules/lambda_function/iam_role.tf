# aws_iam_policy.lambda_basic_execution_policy:
resource "aws_iam_policy" "lambda_basic_execution_policy" {
    description = "Lambda function basic execution policy"
    name        =  var.iam_policy_name
    path        = "/"
    policy = jsonencode({
        "Version": "2012-10-17",
        "Statement": [
            {
                "Effect": "Allow",
                "Action": "logs:CreateLogGroup",
                "Resource": "*"
            },
            {
                "Effect": "Allow",
                "Action": [
                    "logs:CreateLogStream",
                    "logs:PutLogEvents"
                ],
                "Resource": [
                    "*"
                ]
            }
        ]
    })
}

#aws_iam_role.iam_for_lambda
resource "aws_iam_role" "iam_lambda_role" {
  name = var.iam_role_name
  managed_policy_arns = [aws_iam_policy.lambda_basic_execution_policy.arn]
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}