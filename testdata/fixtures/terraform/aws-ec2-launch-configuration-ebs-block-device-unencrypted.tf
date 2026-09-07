# Fixture for aws-ec2-launch-configuration-ebs-block-device-unencrypted.
resource "aws_launch_configuration" "bad1" {
# ruleid: aws-ec2-launch-configuration-ebs-block-device-unencrypted
  ebs_block_device {
  }
}
resource "aws_launch_configuration" "bad2" {
# ruleid: aws-ec2-launch-configuration-ebs-block-device-unencrypted
  ebs_block_device {
  }
}
# ok: aws-ec2-launch-configuration-ebs-block-device-unencrypted
resource "aws_launch_configuration" "good1" {
  ebs_block_device {
    encrypted = true
  }
}
# ok: aws-ec2-launch-configuration-ebs-block-device-unencrypted
resource "aws_launch_configuration" "good2" {
  name = "good2"
}
