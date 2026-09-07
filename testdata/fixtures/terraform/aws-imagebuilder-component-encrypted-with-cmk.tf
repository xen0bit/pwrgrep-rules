# Fixture for aws-imagebuilder-component-encrypted-with-cmk.
# ruleid: aws-imagebuilder-component-encrypted-with-cmk
resource "aws_imagebuilder_component" "bad1" {
}
# ruleid: aws-imagebuilder-component-encrypted-with-cmk
resource "aws_imagebuilder_component" "bad2" {
}
# ok: aws-imagebuilder-component-encrypted-with-cmk
resource "aws_imagebuilder_component" "good1" {
  kms_key_id = "good1-val"
}
# ok: aws-imagebuilder-component-encrypted-with-cmk
resource "aws_imagebuilder_component" "good2" {
  kms_key_id = "good2-val"
}
