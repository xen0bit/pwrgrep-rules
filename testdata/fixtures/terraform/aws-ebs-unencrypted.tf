# CWE-311: EBS encryption by default disabled.
# Setting enabled = false (or omitting it in some regions) leaves new
# EBS volumes unencrypted. The rule flags the resource when enabled is
# false or absent; fix by setting enabled = true.
# ruleid: aws-ebs-unencrypted
resource "aws_ebs_encryption_by_default" "bad1" {
  enabled = false
}
# ruleid: aws-ebs-unencrypted
resource "aws_ebs_encryption_by_default" "bad2" {
  enabled = false
}
# ok: aws-ebs-unencrypted
resource "aws_ebs_encryption_by_default" "good1" {
  enabled = true
}
# ok: aws-ebs-unencrypted
resource "aws_ebs_encryption_by_default" "good2" {
  enabled = true
}

# ok: aws-ebs-unencrypted
resource "aws_ebs_encryption_by_default" "ok3" {
  enabled = true
}
