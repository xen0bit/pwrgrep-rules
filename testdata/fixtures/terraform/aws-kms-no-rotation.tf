# CWE-326: KMS key without rotation — long-lived key material.
# enable_key_rotation = false or omitted leaves annual rotation off;
# symmetric keys should rotate. The rule flags keys without
# enable_key_rotation = true; fix by enabling it (asymmetric keys exempt).
# ruleid: aws-kms-no-rotation
resource "aws_kms_key" "bad1" {
  description = "bad1"
}
# ruleid: aws-kms-no-rotation
resource "aws_kms_key" "bad2" {
  description         = "bad2"
  enable_key_rotation = false
}
# ok: aws-kms-no-rotation
resource "aws_kms_key" "good1" {
  description         = "good1"
  enable_key_rotation = true
}
# ok: aws-kms-no-rotation
resource "aws_kms_key" "good2" {
  description              = "good2"
  customer_master_key_spec = "RSA_2096"
}

# ok: aws-kms-no-rotation
resource "aws_kms_key" "ok3" {
  description         = "ok3"
  enable_key_rotation = true
}
