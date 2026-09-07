# Fixture for aws-lambda-x-ray-tracing-not-active.
# ruleid: aws-lambda-x-ray-tracing-not-active
resource "aws_lambda_function" "bad1" {
}
# ruleid: aws-lambda-x-ray-tracing-not-active
resource "aws_lambda_function" "bad2" {
}
# ok: aws-lambda-x-ray-tracing-not-active
resource "aws_lambda_function" "good1" {
  tracing_config {
    mode = "Active"
  }
}
# ok: aws-lambda-x-ray-tracing-not-active
resource "aws_lambda_function" "good2" {
  tracing_config {
    mode = "Active"
  }
}
