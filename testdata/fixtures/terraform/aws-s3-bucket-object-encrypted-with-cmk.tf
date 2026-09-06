# CWE-311: S3 object without CMK — uses default S3 encryption.
# Missing kms_key_id means the object uses AES256 or AWS-managed key;
# the rule flags objects that omit kms_key_id; fix by setting it.
# ruleid: aws-s3-bucket-object-encrypted-with-cmk
resource "aws_s3_bucket_object" "bad1" {
  bucket = "my-bucket"
  key    = "bad1"
  source = "file.txt"
}
# ruleid: aws-s3-bucket-object-encrypted-with-cmk
resource "aws_s3_bucket_object" "bad2" {
  bucket = "my-bucket"
  key    = "bad2"
  source = "file2.txt"
}
# ok: aws-s3-bucket-object-encrypted-with-cmk
resource "aws_s3_bucket_object" "good1" {
  bucket     = "my-bucket"
  key        = "good1"
  source     = "file.txt"
  kms_key_id = "arn:aws:kms:us-east-1:123456789012:key/abcd"
}
# ok: aws-s3-bucket-object-encrypted-with-cmk
resource "aws_s3_bucket_object" "good2" {
  bucket     = "my-bucket"
  key        = "good2"
  source     = "file2.txt"
  kms_key_id = "arn:aws:kms:us-east-1:123456789012:key/efgh"
}

# ok: aws-s3-bucket-object-encrypted-with-cmk
resource "aws_s3_bucket_object" "ok3" {
  bucket     = "my-bucket"
  key        = "ok3"
  source     = "file.txt"
  kms_key_id = aws_kms_key.example.arn
}
