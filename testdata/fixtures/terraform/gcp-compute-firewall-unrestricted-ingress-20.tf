# Fixture for gcp-compute-firewall-unrestricted-ingress-20.
# ruleid: gcp-compute-firewall-unrestricted-ingress-20
resource "google_compute_firewall" "bad1" {
allow {
  protocol = "tcp"
  ports    = [20]
}
source_ranges = ["0.0.0.0/0"]
}
# ruleid: gcp-compute-firewall-unrestricted-ingress-20
resource "google_compute_firewall" "bad2" {
allow {
  protocol = "tcp"
  ports    = [ "20"]
}
source_ranges = ["0.0.0.0/0"]
}
# ok: gcp-compute-firewall-unrestricted-ingress-20
resource "google_compute_firewall" "good1" {
allow {
  protocol = "tcp"
  ports    = [20]
}
source_ranges = ["10.0.0.0/8"]
}
# ok: gcp-compute-firewall-unrestricted-ingress-20
resource "google_compute_firewall" "good2" {
  name = "good2"
}
