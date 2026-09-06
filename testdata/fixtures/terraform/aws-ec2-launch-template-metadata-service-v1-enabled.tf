# CWE-284: Launch template allows IMDSv1 — metadata service v1
# without token requirement lets any process that can reach 169.254
# fetch credentials. The rule flags templates lacking
# metadata_options with http_tokens = "required" or http_endpoint
# disabled; fix by requiring tokens.
# ruleid: aws-ec2-launch-template-metadata-service-v1-enabled
resource "aws_launch_template" "bad1" {
  name = "bad1"
}
# ruleid: aws-ec2-launch-template-metadata-service-v1-enabled
resource "aws_launch_template" "bad2" {
  name = "bad2"
  metadata_options {
    http_tokens = "optional"
  }
}
# ok: aws-ec2-launch-template-metadata-service-v1-enabled
resource "aws_launch_template" "good1" {
  name = "good1"
  metadata_options {
    http_tokens = "required"
  }
}
# ok: aws-ec2-launch-template-metadata-service-v1-enabled
resource "aws_launch_template" "good2" {
  name = "good2"
  metadata_options {
    http_endpoint = "disabled"
  }
}
# ok: aws-ec2-launch-template-metadata-service-v1-enabled
resource "aws_launch_template" "ok3" {
  name = "ok3"
  metadata_options {
    http_tokens = "required"
  }
}
