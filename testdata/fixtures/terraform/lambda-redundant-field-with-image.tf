# Fixture for lambda-redundant-field-with-image.
resource "aws_lambda_function" "bad1" {
  package_type = "Image"
# ruleid: lambda-redundant-field-with-image
  handler = "index.handler"
}
resource "aws_lambda_function" "bad2" {
  package_type = "Image"
# ruleid: lambda-redundant-field-with-image
  runtime = "python3.9"
}
# ok: lambda-redundant-field-with-image
resource "aws_lambda_function" "good1" {
  package_type = "Image"
}
# ok: lambda-redundant-field-with-image
resource "aws_lambda_function" "good2" {
  package_type = "Image"
}
