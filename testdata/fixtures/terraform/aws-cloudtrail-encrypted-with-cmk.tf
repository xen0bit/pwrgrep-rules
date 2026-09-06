# CWE-311: CloudTrail logs without CMK — encrypted only with default key.
# A trail without kms_key_id uses the AWS-managed key, limiting control
# over log confidentiality. The rule flags trails that omit kms_key_id.
# Fix by setting kms_key_id to a customer-managed KMS key.
# ruleid: aws-cloudtrail-encrypted-with-cmk
resource "aws_cloudtrail" "bad1" {
  name           = "bad1"
  s3_bucket_name = "my-bucket"
}
# ruleid: aws-cloudtrail-encrypted-with-cmk
resource "aws_cloudtrail" "bad2" {
  name           = "bad2"
  s3_bucket_name = "my-bucket2"
}
# ok: aws-cloudtrail-encrypted-with-cmk
resource "aws_cloudtrail" "good1" {
  name           = "good1"
  s3_bucket_name = "my-bucket"
  kms_key_id     = "arn:aws:kms:us-east-1:123456789012:key/abcd"
}
# ok: aws-cloudtrail-encrypted-with-cmk
resource "aws_cloudtrail" "good2" {
  name           = "good2"
  s3_bucket_name = "my-bucket2"
  kms_key_id     = "arn:aws:kms:us-east-1:123456789012:key/efgh"
}

# ok: aws-cloudtrail-encrypted-with-cmk
resource "aws_cloudtrail" "ok3" {
  name           = "ok3"
  s3_bucket_name = "my-bucket"
  kms_key_id     = aws_kms_key.example.arn
}
