# Fixture for gcp-build-workers-private.
# ruleid: gcp-build-workers-private
resource "google_cloudbuild_worker_pool" "bad1" {
  name = "bad1"
}
# ruleid: gcp-build-workers-private
resource "google_cloudbuild_worker_pool" "bad2" {
  name = "bad2"
}
# ok: gcp-build-workers-private
resource "google_cloudbuild_worker_pool" "good1" {
worker_config {
  no_external_ip = true
}
}
# ok: gcp-build-workers-private
resource "google_cloudbuild_worker_pool" "good2" {
worker_config {
  no_external_ip = true
}
}
