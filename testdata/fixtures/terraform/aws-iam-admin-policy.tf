# Fixture for aws-iam-admin-policy.
resource "aws_iam_policy" "bad1" {
# ruleid: aws-iam-admin-policy
  policy = "example-val"
}
resource "aws_iam_policy" "bad2" {
# ruleid: aws-iam-admin-policy
  policy = "example-val"
}
# ok: aws-iam-admin-policy
resource "aws_iam_policy" "good1" {
  name = "good1"
}
# ok: aws-iam-admin-policy
resource "aws_iam_policy" "good2" {
  name = "good2"
}
