# Fixture for aws-transfer-server-is-public.
# ruleid: aws-transfer-server-is-public
resource "aws_transfer_server" "bad1" {
}
# ruleid: aws-transfer-server-is-public
resource "aws_transfer_server" "bad2" {
}
# ok: aws-transfer-server-is-public
resource "aws_transfer_server" "good1" {
  endpoint_type = "VPC"
}
# ok: aws-transfer-server-is-public
resource "aws_transfer_server" "good2" {
  endpoint_type = "VPC"
}
