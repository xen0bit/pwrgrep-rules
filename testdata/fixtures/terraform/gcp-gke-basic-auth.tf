# Fixture for gcp-gke-basic-auth.
# ruleid: gcp-gke-basic-auth
resource "google_container_cluster" "bad1" {
  name = "bad1"
}
# ruleid: gcp-gke-basic-auth
resource "google_container_cluster" "bad2" {
  name = "bad2"
}
# ok: gcp-gke-basic-auth
resource "google_container_cluster" "good1" {
master_auth {
  client_certificate_config {
  }
}
}
# ok: gcp-gke-basic-auth
resource "google_container_cluster" "good2" {
master_auth {
  username = ""
  password = ""
}
}
