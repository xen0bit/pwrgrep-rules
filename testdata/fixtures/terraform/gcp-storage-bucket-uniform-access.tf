# Fixture for gcp-storage-bucket-uniform-access.
# ruleid: gcp-storage-bucket-uniform-access
resource "google_storage_bucket" "bad1" {
  name = "bad1"
}
# ruleid: gcp-storage-bucket-uniform-access
resource "google_storage_bucket" "bad2" {
  name = "bad2"
}
# ok: gcp-storage-bucket-uniform-access
resource "google_storage_bucket" "good1" {
uniform_bucket_level_access = true
}
# ok: gcp-storage-bucket-uniform-access
resource "google_storage_bucket" "good2" {
uniform_bucket_level_access = true
}
