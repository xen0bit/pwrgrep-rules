# CWE-311: EBS volume unencrypted — no encrypted = true.
# A volume without encrypted = true is created unencrypted; the default
# is false. The rule flags volumes that omit the flag; fix by setting
# encrypted = true.
# ruleid: aws-ebs-volume-unencrypted
resource "aws_ebs_volume" "bad1" {
  availability_zone = "us-east-1a"
  size              = 40
}
# ruleid: aws-ebs-volume-unencrypted
resource "aws_ebs_volume" "bad2" {
  availability_zone = "us-east-1b"
  size              = 20
}
# ok: aws-ebs-volume-unencrypted
resource "aws_ebs_volume" "good1" {
  availability_zone = "us-east-1a"
  size              = 40
  encrypted         = true
}
# ok: aws-ebs-volume-unencrypted
resource "aws_ebs_volume" "good2" {
  availability_zone = "us-east-1a"
  size              = 50
  encrypted         = true
}

# ok: aws-ebs-volume-unencrypted
resource "aws_ebs_volume" "ok3" {
  availability_zone = "us-east-1a"
  size              = 40
  encrypted         = true
  kms_key_id        = aws_kms_key.example.arn
}
