# Fixture for aws-lambda-permission-unrestricted-source-arn.
# ruleid: aws-lambda-permission-unrestricted-source-arn
resource "aws_lambda_permission" "bad1" {
  statement_id = "AllowExecutionFromSNS1"
  action = "lambda:InvokeFunction"
  function_name = "bad1"
  principal = "sns.amazonaws.com"
}
# ruleid: aws-lambda-permission-unrestricted-source-arn
resource "aws_lambda_permission" "bad2" {
  statement_id = "AllowExecutionFromEvents2"
  action = "lambda:InvokeFunction"
  function_name = "bad2"
  principal = "events.amazonaws.com"
}
# ok: aws-lambda-permission-unrestricted-source-arn
resource "aws_lambda_permission" "good1" {
  statement_id = "AllowExecutionFromSNS1"
  action = "lambda:InvokeFunction"
  function_name = "good1"
  principal = "sns.amazonaws.com"
  source_arn = "arn:aws:sns:us-east-1:123456789012:good1"
}
# ok: aws-lambda-permission-unrestricted-source-arn
resource "aws_lambda_permission" "good2" {
  statement_id = "AllowExecutionFromAccount"
  action = "lambda:InvokeFunction"
  function_name = "good2"
  principal = "123456789012"
}
