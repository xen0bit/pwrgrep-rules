# Fixture for gcp-gke-binary-authorization.
# ruleid: gcp-gke-binary-authorization
resource "google_container_cluster" "bad1" {
  name = "bad1"
}
# ruleid: gcp-gke-binary-authorization
resource "google_container_cluster" "bad2" {
  name = "bad2"
}
# ok: gcp-gke-binary-authorization
resource "google_container_cluster" "good1" {
enable_binary_authorization = true
}
# ok: gcp-gke-binary-authorization
resource "google_container_cluster" "good2" {
enable_binary_authorization = true
}
