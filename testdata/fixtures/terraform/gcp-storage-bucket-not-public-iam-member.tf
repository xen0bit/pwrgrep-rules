# Fixture for gcp-storage-bucket-not-public-iam-member.
# ruleid: gcp-storage-bucket-not-public-iam-member
resource "google_storage_bucket_iam_member" "bad1" {
member = "allUsers"
}
# ruleid: gcp-storage-bucket-not-public-iam-member
resource "google_storage_bucket_iam_member" "bad2" {
member = "allUsers"
}
# ok: gcp-storage-bucket-not-public-iam-member
resource "google_storage_bucket_iam_member" "good1" {
member = "safe-fixed"
}
# ok: gcp-storage-bucket-not-public-iam-member
resource "google_storage_bucket_iam_member" "good2" {
  name = "good2"
}
