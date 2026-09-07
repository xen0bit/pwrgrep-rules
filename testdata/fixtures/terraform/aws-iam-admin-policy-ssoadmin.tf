# Fixture for aws-iam-admin-policy-ssoadmin.
resource "aws_ssoadmin_permission_set_inline_policy" "bad1" {
# ruleid: aws-iam-admin-policy-ssoadmin
  inline_policy = "example-val"
}
resource "aws_ssoadmin_permission_set_inline_policy" "bad2" {
# ruleid: aws-iam-admin-policy-ssoadmin
  inline_policy = "example-val"
}
# ok: aws-iam-admin-policy-ssoadmin
resource "aws_ssoadmin_permission_set_inline_policy" "good1" {
  name = "good1"
}
# ok: aws-iam-admin-policy-ssoadmin
resource "aws_ssoadmin_permission_set_inline_policy" "good2" {
  name = "good2"
}
