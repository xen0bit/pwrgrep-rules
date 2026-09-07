# Fixture for gcp-gke-kubernetes-rbac-google-groups.
# ruleid: gcp-gke-kubernetes-rbac-google-groups
resource "google_container_cluster" "bad1" {
  name = "bad1"
}
# ruleid: gcp-gke-kubernetes-rbac-google-groups
resource "google_container_cluster" "bad2" {
  name = "bad2"
}
# ok: gcp-gke-kubernetes-rbac-google-groups
resource "google_container_cluster" "good1" {
authenticator_groups_config {
  security_group = "good1-val"
}
}
# ok: gcp-gke-kubernetes-rbac-google-groups
resource "google_container_cluster" "good2" {
authenticator_groups_config {
  security_group = "good2-val"
}
}
