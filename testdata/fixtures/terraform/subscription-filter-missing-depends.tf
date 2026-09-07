# Fixture for subscription-filter-missing-depends.
# ruleid: subscription-filter-missing-depends
resource "aws_cloudwatch_log_subscription_filter" "bad1" {
  destination_arn = aws_lambda_function.example.arn
}
# ruleid: subscription-filter-missing-depends
resource "aws_cloudwatch_log_subscription_filter" "bad2" {
  destination_arn = aws_lambda_function.example2.arn
}
# ok: subscription-filter-missing-depends
resource "aws_cloudwatch_log_subscription_filter" "good1" {
  destination_arn = aws_lambda_function.example.arn
  depends_on = [aws_lambda_permission.example]
}
# ok: subscription-filter-missing-depends
resource "aws_cloudwatch_log_subscription_filter" "good2" {
  name = "good2"
}
