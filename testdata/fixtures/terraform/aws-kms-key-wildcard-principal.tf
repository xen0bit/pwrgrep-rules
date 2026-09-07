# Fixture for aws-kms-key-wildcard-principal.
resource "aws_kms_key" "bad1" {
# ruleid: aws-kms-key-wildcard-principal
  policy = "example-val"
}
resource "aws_kms_key" "bad2" {
# ruleid: aws-kms-key-wildcard-principal
  policy = "example-val"
}
# ok: aws-kms-key-wildcard-principal
resource "aws_kms_key" "good1" {
  name = "good1"
}
# ok: aws-kms-key-wildcard-principal
resource "aws_kms_key" "good2" {
  name = "good2"
}
