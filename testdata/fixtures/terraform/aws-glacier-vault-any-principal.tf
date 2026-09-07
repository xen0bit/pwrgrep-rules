# Fixture for aws-glacier-vault-any-principal.
resource "aws_glacier_vault" "bad1" {
# ruleid: aws-glacier-vault-any-principal
  access_policy = "example-val"
}
resource "aws_glacier_vault" "bad2" {
# ruleid: aws-glacier-vault-any-principal
  access_policy = "example-val"
}
# ok: aws-glacier-vault-any-principal
resource "aws_glacier_vault" "good1" {
  name = "good1"
}
# ok: aws-glacier-vault-any-principal
resource "aws_glacier_vault" "good2" {
  name = "good2"
}
