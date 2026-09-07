# Fixture for gcp-compute-ip-forward.
# ruleid: gcp-compute-ip-forward
resource "google_compute_instance" "bad1" {
can_ip_forward = true
}
# ruleid: gcp-compute-ip-forward
resource "google_compute_instance" "bad2" {
can_ip_forward = true
}
# ok: gcp-compute-ip-forward
resource "google_compute_instance" "good1" {
can_ip_forward = false
}
# ok: gcp-compute-ip-forward
resource "google_compute_instance" "good2" {
  name = "good2"
}
