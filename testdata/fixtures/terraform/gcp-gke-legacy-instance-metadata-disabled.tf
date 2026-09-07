# Fixture for gcp-gke-legacy-instance-metadata-disabled.
# ruleid: gcp-gke-legacy-instance-metadata-disabled
resource "google_container_cluster" "bad1" {
  name = "bad1"
}
# ruleid: gcp-gke-legacy-instance-metadata-disabled
resource "google_container_cluster" "bad2" {
  name = "bad2"
}
# ok: gcp-gke-legacy-instance-metadata-disabled
resource "google_container_cluster" "good1" {
min_master_version = 1.12
}
# ok: gcp-gke-legacy-instance-metadata-disabled
resource "google_container_cluster" "good2" {
min_master_version = 1.13
}
