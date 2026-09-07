# Fixture for lambda-permission-logs-missing-arn-asterisk.
resource "aws_lambda_permission" "bad1" {
# ruleid: lambda-permission-logs-missing-arn-asterisk
  source_arn = "example-val"
}
resource "aws_lambda_permission" "bad2" {
# ruleid: lambda-permission-logs-missing-arn-asterisk
  source_arn = "example-val"
}
# ok: lambda-permission-logs-missing-arn-asterisk
resource "aws_lambda_permission" "good1" {
  name = "good1"
}
# ok: lambda-permission-logs-missing-arn-asterisk
resource "aws_lambda_permission" "good2" {
  name = "good2"
}
