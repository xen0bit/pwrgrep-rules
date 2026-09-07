# Fixture for gcp-project-default-network.
# ruleid: gcp-project-default-network
resource "google_project" "bad1" {
  name = "bad1"
}
# ruleid: gcp-project-default-network
resource "google_project" "bad2" {
  name = "bad2"
}
# ok: gcp-project-default-network
resource "google_project" "good1" {
auto_create_network   = false
}
# ok: gcp-project-default-network
resource "google_project" "good2" {
auto_create_network   = false
}
