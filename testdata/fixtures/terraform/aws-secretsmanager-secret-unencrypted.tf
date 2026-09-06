# CWE-311: Secrets Manager secret without CMK.
# Without kms_key_id the secret uses the default AWS key; the rule flags
# secrets that omit it. Fix by setting kms_key_id to a CMK; omission is
# insecure, so the finding is expected on the resource header.
# ruleid: aws-secretsmanager-secret-unencrypted
resource "aws_secretsmanager_secret" "bad1" {
  name = "bad1"
}
# ruleid: aws-secretsmanager-secret-unencrypted
resource "aws_secretsmanager_secret" "bad2" {
  name = "bad2"
}
# ok: aws-secretsmanager-secret-unencrypted
resource "aws_secretsmanager_secret" "good1" {
  name       = "good1"
  kms_key_id = "arn:aws:kms:us-east-1:123456789012:key/abcd"
}
# ok: aws-secretsmanager-secret-unencrypted
resource "aws_secretsmanager_secret" "good2" {
  name       = "good2"
  kms_key_id = "arn:aws:kms:us-east-1:123456789012:key/efgh"
}

# ok: aws-secretsmanager-secret-unencrypted
resource "aws_secretsmanager_secret" "ok3" {
  name       = "ok3"
  kms_key_id = aws_kms_key.example.arn
}
