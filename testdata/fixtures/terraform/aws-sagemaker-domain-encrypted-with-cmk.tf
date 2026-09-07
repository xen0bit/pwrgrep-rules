# Fixture for aws-sagemaker-domain-encrypted-with-cmk.
# ruleid: aws-sagemaker-domain-encrypted-with-cmk
resource "aws_sagemaker_domain" "bad1" {
}
# ruleid: aws-sagemaker-domain-encrypted-with-cmk
resource "aws_sagemaker_domain" "bad2" {
}
# ok: aws-sagemaker-domain-encrypted-with-cmk
resource "aws_sagemaker_domain" "good1" {
  kms_key_id = "good1-val"
}
# ok: aws-sagemaker-domain-encrypted-with-cmk
resource "aws_sagemaker_domain" "good2" {
  kms_key_id = "good2-val"
}
