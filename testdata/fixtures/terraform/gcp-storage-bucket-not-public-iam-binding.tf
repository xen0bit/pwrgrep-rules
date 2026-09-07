# Fixture for gcp-storage-bucket-not-public-iam-binding.
# ruleid: gcp-storage-bucket-not-public-iam-binding
resource "google_storage_bucket_iam_binding" "bad1" {
members = [ "allAuthenticatedUsers"]
}
# ruleid: gcp-storage-bucket-not-public-iam-binding
resource "google_storage_bucket_iam_binding" "bad2" {
members = [ "allAuthenticatedUsers"]
}
# ok: gcp-storage-bucket-not-public-iam-binding
resource "google_storage_bucket_iam_binding" "good1" {
members = [ "user:good@example.com"]
}
# ok: gcp-storage-bucket-not-public-iam-binding
resource "google_storage_bucket_iam_binding" "good2" {
  name = "good2"
}
