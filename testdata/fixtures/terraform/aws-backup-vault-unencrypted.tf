# CWE-326: Backup vault without CMK — falls back to AWS-managed key.
# No kms_key_arn means the vault uses the default AWS key; rotation
# and access control cannot be enforced. The rule flags any
# aws_backup_vault that omits kms_key_arn; fix by setting it to a CMK.
# ruleid: aws-backup-vault-unencrypted
resource "aws_backup_vault" "bad1" {
  name = "bad1"
}
# ruleid: aws-backup-vault-unencrypted
resource "aws_backup_vault" "bad2" {
  name = "bad2"
}
# ok: aws-backup-vault-unencrypted
resource "aws_backup_vault" "good1" {
  name        = "good1"
  kms_key_arn = "arn:aws:kms:us-east-1:123456789012:key/abcd1234-a123-456a-a12b-a123b4cd56f"
}
# ok: aws-backup-vault-unencrypted
resource "aws_backup_vault" "good2" {
  name        = "good2"
  kms_key_arn = "arn:aws:kms:us-east-1:123456789012:key/efgh5678-b123-456b-b12c-b123c4de56f7"
}

# ok: aws-backup-vault-unencrypted
resource "aws_backup_vault" "ok3" {
  name        = "ok3"
  kms_key_arn = aws_kms_key.example.arn
}
