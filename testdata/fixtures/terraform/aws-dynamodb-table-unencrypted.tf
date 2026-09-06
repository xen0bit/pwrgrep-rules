# CWE-311: DynamoDB table without CMK — uses AWS-owned key.
# Without a server_side_encryption block with kms_key_arn the table
# falls back to the AWS default. The rule flags tables that omit
# that block; fix by enabling encryption with a CMK.
# ruleid: aws-dynamodb-table-unencrypted
resource "aws_dynamodb_table" "bad1" {
  name         = "bad1"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "id"
  attribute {
    name = "id"
    type = "S"
  }
}
# ruleid: aws-dynamodb-table-unencrypted
resource "aws_dynamodb_table" "bad2" {
  name         = "bad2"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "id"
  attribute {
    name = "id"
    type = "S"
  }
}
# ok: aws-dynamodb-table-unencrypted
resource "aws_dynamodb_table" "good1" {
  name         = "good1"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "id"
  attribute {
    name = "id"
    type = "S"
  }
  server_side_encryption {
    enabled     = true
    kms_key_arn = "arn:aws:kms:us-east-1:123456789012:key/abcd"
  }
}
# ok: aws-dynamodb-table-unencrypted
resource "aws_dynamodb_table" "good2" {
  name         = "good2"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "id"
  attribute {
    name = "id"
    type = "S"
  }
  server_side_encryption {
    enabled     = true
    kms_key_arn = "arn:aws:kms:us-east-1:123456789012:key/efgh"
  }
}

# ok: aws-dynamodb-table-unencrypted
resource "aws_dynamodb_table" "ok3" {
  name         = "ok3"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "id"
  attribute {
    name = "id"
    type = "S"
  }
  server_side_encryption {
    enabled     = true
    kms_key_arn = aws_kms_key.example.arn
  }
}
