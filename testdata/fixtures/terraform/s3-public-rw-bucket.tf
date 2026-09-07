# Fixture for s3-public-rw-bucket.
resource "example" "bad1" {
# ruleid: s3-public-rw-bucket
  acl = "public-read-write"
}
resource "example" "bad2" {
# ruleid: s3-public-rw-bucket
  acl = "public-read-write"
}
# ok: s3-public-rw-bucket
resource "example" "good1" {
  name = "good1"
}
# ok: s3-public-rw-bucket
resource "example" "good2" {
  name = "good2"
}
