# CWE-311: Redshift cluster without CMK — uses default encryption.
# Without kms_key_id the cluster is encrypted with the AWS-managed key
# if at all. The rule flags clusters that omit kms_key_id; fix by
# setting it to a CMK ARN.
# ruleid: aws-redshift-cluster-encrypted-with-cmk
resource "aws_redshift_cluster" "bad1" {
  cluster_identifier = "bad1"
  node_type          = "dc2.large"
}
# ruleid: aws-redshift-cluster-encrypted-with-cmk
resource "aws_redshift_cluster" "bad2" {
  cluster_identifier = "bad2"
  node_type          = "dc2.large"
}
# ok: aws-redshift-cluster-encrypted-with-cmk
resource "aws_redshift_cluster" "good1" {
  cluster_identifier = "good1"
  node_type          = "dc2.large"
  kms_key_id         = "arn:aws:kms:us-east-1:123456789012:key/abcd"
}
# ok: aws-redshift-cluster-encrypted-with-cmk
resource "aws_redshift_cluster" "good2" {
  cluster_identifier = "good2"
  node_type          = "dc2.large"
  kms_key_id         = "arn:aws:kms:us-east-1:123456789012:key/efgh"
}

# ok: aws-redshift-cluster-encrypted-with-cmk
resource "aws_redshift_cluster" "ok3" {
  cluster_identifier = "ok3"
  node_type          = "dc2.large"
  kms_key_id         = aws_kms_key.example.arn
}
