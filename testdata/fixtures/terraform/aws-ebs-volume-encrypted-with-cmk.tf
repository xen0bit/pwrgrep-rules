# CWE-311: EBS volume with AWS-managed key — not using CMK.
# encrypted = true alone uses the default AWS key; without kms_key_id
# the customer cannot rotate or scope the key. The rule flags volumes
# with encrypted true but no kms_key_id; fix by adding kms_key_id.
# ruleid: aws-ebs-volume-encrypted-with-cmk
resource "aws_ebs_volume" "bad1" {
  availability_zone = "us-east-1a"
  size              = 40
  encrypted         = true
}
# ruleid: aws-ebs-volume-encrypted-with-cmk
resource "aws_ebs_volume" "bad2" {
  availability_zone = "us-east-1b"
  size              = 20
  encrypted         = true
}
# ok: aws-ebs-volume-encrypted-with-cmk
resource "aws_ebs_volume" "good1" {
  availability_zone = "us-east-1a"
  size              = 40
  encrypted         = true
  kms_key_id        = "arn:aws:kms:us-east-1:123456789012:key/abcd"
}
# ok: aws-ebs-volume-encrypted-with-cmk
resource "aws_ebs_volume" "good2" {
  availability_zone = "us-east-1a"
  size              = 50
  encrypted         = true
  kms_key_id        = aws_kms_key.example.arn
}
# ok: aws-ebs-volume-encrypted-with-cmk
resource "aws_ebs_volume" "ok3" {
  availability_zone = "us-east-1a"
  size              = 40
  encrypted         = true
  kms_key_id        = aws_kms_key.example.arn
}
