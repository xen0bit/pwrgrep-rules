# Fixture for aws-lambda-environment-unencrypted.
# Ok blocks come first: the kms_key_arn exclusion spans forward otherwise.
# The finding lands on the environment block, so the annotation sits inside.
# ok: aws-lambda-environment-unencrypted
resource "aws_lambda_function" "good1" {
  function_name = "good1"
  role = "arn:aws:iam::123456789012:role/good1"
  kms_key_arn = "arn:aws:kms:us-east-1:123456789012:key/good1"
  environment {
    variables = {
      FOO = "bar"
    }
  }
}
# ok: aws-lambda-environment-unencrypted
resource "aws_lambda_function" "good2" {
  function_name = "good2"
  role = "arn:aws:iam::123456789012:role/good2"
}
resource "aws_lambda_function" "bad1" {
  function_name = "bad1"
  role = "arn:aws:iam::123456789012:role/bad1"
# ruleid: aws-lambda-environment-unencrypted
  environment {
    variables = {
      FOO = "bar"
    }
  }
}
resource "aws_lambda_function" "bad2" {
  function_name = "bad2"
  role = "arn:aws:iam::123456789012:role/bad2"
# ruleid: aws-lambda-environment-unencrypted
  environment {
    variables = {
      FOO = "bar"
    }
  }
}
