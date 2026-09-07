# Fixture for gcp-gke-client-certificate-disabled.
# ruleid: gcp-gke-client-certificate-disabled
resource "google_container_cluster" "bad1" {
  name = "bad1"
}
# ruleid: gcp-gke-client-certificate-disabled
resource "google_container_cluster" "bad2" {
  name = "bad2"
}
# ok: gcp-gke-client-certificate-disabled
resource "google_container_cluster" "good1" {
master_auth {
  client_certificate_config {
    issue_client_certificate = false
  }
}
}
# ok: gcp-gke-client-certificate-disabled
resource "google_container_cluster" "good2" {
master_auth {
  client_certificate_config {
    issue_client_certificate = false
  }
}
}
