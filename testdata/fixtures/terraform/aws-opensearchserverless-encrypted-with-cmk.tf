# Fixture for aws-opensearchserverless-encrypted-with-cmk.
# Only the quoted policy= branch can fire (see the ecr fixture for why), and
# it keeps matches whose token mentions AWSOwnedKey. Values below are single
# tokens, the only shape that branch reads.
resource "aws_opensearchserverless_security_policy" "bad1" {
  name = "bad1"
  type = "encryption"
# ruleid: aws-opensearchserverless-encrypted-with-cmk
  policy = "x-AWSOwnedKey-x"
}
resource "aws_opensearchserverless_security_policy" "bad2" {
  name = "bad2"
  type = "encryption"
# ruleid: aws-opensearchserverless-encrypted-with-cmk
  policy = "y-AWSOwnedKey-y"
}
# ok: aws-opensearchserverless-encrypted-with-cmk
resource "aws_opensearchserverless_security_policy" "good1" {
  name = "good1"
  type = "encryption"
  policy = "cmk-encrypted"
}
# ok: aws-opensearchserverless-encrypted-with-cmk
resource "aws_opensearchserverless_security_policy" "good2" {
  name = "good2"
  type = "encryption"
}
