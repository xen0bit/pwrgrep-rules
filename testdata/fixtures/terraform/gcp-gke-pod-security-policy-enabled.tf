# Fixture for gcp-gke-pod-security-policy-enabled.
# ruleid: gcp-gke-pod-security-policy-enabled
resource "google_container_cluster" "bad1" {
  name = "bad1"
}
# ruleid: gcp-gke-pod-security-policy-enabled
resource "google_container_cluster" "bad2" {
  name = "bad2"
}
# ok: gcp-gke-pod-security-policy-enabled
resource "google_container_cluster" "good1" {
pod_security_policy_config {
  enabled = true
}
}
# ok: gcp-gke-pod-security-policy-enabled
resource "google_container_cluster" "good2" {
pod_security_policy_config {
  enabled = true
}
}
