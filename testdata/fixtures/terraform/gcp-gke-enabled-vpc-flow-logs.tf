# Fixture for gcp-gke-enabled-vpc-flow-logs.
# ruleid: gcp-gke-enabled-vpc-flow-logs
resource "google_container_cluster" "bad1" {
  name = "bad1"
}
# ruleid: gcp-gke-enabled-vpc-flow-logs
resource "google_container_cluster" "bad2" {
  name = "bad2"
}
# ok: gcp-gke-enabled-vpc-flow-logs
resource "google_container_cluster" "good1" {
  enable_intranode_visibility = true
}
# ok: gcp-gke-enabled-vpc-flow-logs
resource "google_container_cluster" "good2" {
  enable_intranode_visibility = true
}
