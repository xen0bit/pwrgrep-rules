# Fixture for gcp-compute-template-ip-forward.
# ruleid: gcp-compute-template-ip-forward
resource "google_compute_instance_template" "bad1" {
can_ip_forward = true
}
# ruleid: gcp-compute-template-ip-forward
resource "google_compute_instance_template" "bad2" {
can_ip_forward = true
}
# ok: gcp-compute-template-ip-forward
resource "google_compute_instance_template" "good1" {
can_ip_forward = false
}
# ok: gcp-compute-template-ip-forward
resource "google_compute_instance_template" "good2" {
  name = "good2"
}
