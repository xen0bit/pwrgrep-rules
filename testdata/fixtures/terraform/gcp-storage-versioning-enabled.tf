# Fixture for gcp-storage-versioning-enabled.
# ruleid: gcp-storage-versioning-enabled
resource "google_storage_bucket" "bad1" {
  name = "bad1"
}
# ruleid: gcp-storage-versioning-enabled
resource "google_storage_bucket" "bad2" {
  name = "bad2"
}
# ok: gcp-storage-versioning-enabled
resource "google_storage_bucket" "good1" {
versioning = {
  enabled = true
}
}
# ok: gcp-storage-versioning-enabled
resource "google_storage_bucket" "good2" {
versioning = {
  enabled = true
}
}
