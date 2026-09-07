# Fixture for wildcard-assume-role.
resource "aws_iam_role" "bad1" {
# ruleid: wildcard-assume-role
  assume_role_policy = "example-val"
}
resource "aws_iam_role" "bad2" {
# ruleid: wildcard-assume-role
  assume_role_policy = "example-val"
}
# ok: wildcard-assume-role
resource "aws_iam_role" "good1" {
  name = "good1"
}
# ok: wildcard-assume-role
resource "aws_iam_role" "good2" {
  name = "good2"
}
