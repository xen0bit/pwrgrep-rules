# Fixture for ec2-imdsv1-optional.
# ruleid: ec2-imdsv1-optional
resource "aws_instance" "bad1" {
}
# ruleid: ec2-imdsv1-optional
resource "aws_instance" "bad2" {
}
# ok: ec2-imdsv1-optional
resource "aws_instance" "good1" {
  metadata_options {
    http_tokens = "required"
  }
}
# ok: ec2-imdsv1-optional
resource "aws_instance" "good2" {
  metadata_options {
    http_endpoint = "disabled"
  }
}
