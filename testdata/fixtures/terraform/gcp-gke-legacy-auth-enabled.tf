# Fixture for gcp-gke-legacy-auth-enabled.
# ruleid: gcp-gke-legacy-auth-enabled
resource "google_container_cluster" "bad1" {
enable_legacy_abac = true
}
# ruleid: gcp-gke-legacy-auth-enabled
resource "google_container_cluster" "bad2" {
enable_legacy_abac = true
}
# ok: gcp-gke-legacy-auth-enabled
resource "google_container_cluster" "good1" {
enable_legacy_abac = false
}
# ok: gcp-gke-legacy-auth-enabled
resource "google_container_cluster" "good2" {
  name = "good2"
}
