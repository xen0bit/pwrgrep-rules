# Fixture for missing-athena-workgroup-encryption.
# Ok blocks come first: the encryption exclusion spans forward otherwise.
# ok: missing-athena-workgroup-encryption
resource "aws_athena_workgroup" "good1" {
  name = "good1"
  encryption_configuration {
    encryption_option = "SSE_KMS"
  }
}
# ok: missing-athena-workgroup-encryption
resource "aws_athena_workgroup" "good2" {
  name = "good2"
  encryption_configuration {
    encryption_option = "SSE_S3"
  }
}
# ruleid: missing-athena-workgroup-encryption
resource "aws_athena_workgroup" "bad1" {
  name = "bad1"
}
# ruleid: missing-athena-workgroup-encryption
resource "aws_athena_workgroup" "bad2" {
  name = "bad2"
}
