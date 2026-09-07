# Fixture for aws-emr-encrypted-with-cmk.
resource "aws_emr_security_configuration" "bad1" {
# ruleid: aws-emr-encrypted-with-cmk
  configuration = "example-val"
}
resource "aws_emr_security_configuration" "bad2" {
# ruleid: aws-emr-encrypted-with-cmk
  configuration = "example-val"
}
# ok: aws-emr-encrypted-with-cmk
resource "aws_emr_security_configuration" "good1" {
  name = "good1"
}
# ok: aws-emr-encrypted-with-cmk
resource "aws_emr_security_configuration" "good2" {
  name = "good2"
}
