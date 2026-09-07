# Fixture for aws-ec2-launch-configuration-root-block-device-unencrypted.
# ruleid: aws-ec2-launch-configuration-root-block-device-unencrypted
resource "aws_launch_configuration" "bad1" {
}
# ruleid: aws-ec2-launch-configuration-root-block-device-unencrypted
resource "aws_launch_configuration" "bad2" {
}
# ok: aws-ec2-launch-configuration-root-block-device-unencrypted
resource "aws_launch_configuration" "good1" {
  root_block_device {
    encrypted = true
  }
}
# ok: aws-ec2-launch-configuration-root-block-device-unencrypted
resource "aws_launch_configuration" "good2" {
  root_block_device {
    encrypted = true
  }
}
