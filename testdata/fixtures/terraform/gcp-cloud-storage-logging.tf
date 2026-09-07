# Fixture for gcp-cloud-storage-logging.
# ruleid: gcp-cloud-storage-logging
resource "google_storage_bucket" "bad1" {
}
# ruleid: gcp-cloud-storage-logging
resource "google_storage_bucket" "bad2" {
}
# ok: gcp-cloud-storage-logging
resource "google_storage_bucket" "good1" {
  logging {
      log_bucket = "good1-val"
  }          
}
# ok: gcp-cloud-storage-logging
resource "google_storage_bucket" "good2" {
  logging {
      log_bucket = "good2-val"
  }          
}
