# Fixture for reserved-aws-lambda-environment-variable.
resource "aws_lambda_function" "bad1" {
  function_name = "bad1"
  environment {
    variables = {
# ruleid: reserved-aws-lambda-environment-variable
      AWS_REGION = "us-east-1"
    }
  }
}
resource "aws_lambda_function" "bad2" {
  function_name = "bad2"
  environment {
    variables = {
# ruleid: reserved-aws-lambda-environment-variable
      _HANDLER = "index.handler"
    }
  }
}
# ok: reserved-aws-lambda-environment-variable
resource "aws_lambda_function" "good1" {
  function_name = "good1"
  environment {
    variables = {
      MY_VAR = "hello"
    }
  }
}
# ok: reserved-aws-lambda-environment-variable
resource "aws_lambda_function" "good2" {
  function_name = "good2"
}
