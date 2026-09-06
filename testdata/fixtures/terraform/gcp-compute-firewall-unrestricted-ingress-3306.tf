# CWE-284: GCP firewall unrestricted MySQL 3306.
# ruleid: gcp-compute-firewall-unrestricted-ingress-3306
resource "google_compute_firewall" "bad1" {
  name    = "allow-mysql"
  network = "default"
  allow {
    protocol = "tcp"
    ports    = ["3306"]
  }
  source_ranges = ["0.0.0.0/0"]
}
# ruleid: gcp-compute-firewall-unrestricted-ingress-3306
resource "google_compute_firewall" "bad2" {
  name    = "allow-mysql-range"
  network = "default"
  allow {
    protocol = "tcp"
    ports    = ["22", "3306", "80"]
  }
  source_ranges = ["0.0.0.0/0"]
}
# ok: gcp-compute-firewall-unrestricted-ingress-3306
resource "google_compute_firewall" "good1" {
  name    = "allow-mysql-private"
  network = "default"
  allow {
    protocol = "tcp"
    ports    = ["3306"]
  }
  source_ranges = ["10.0.0.0/24"]
}
# ok: gcp-compute-firewall-unrestricted-ingress-3306
resource "google_compute_firewall" "good2" {
  name    = "allow-http"
  network = "default"
  allow {
    protocol = "tcp"
    ports    = ["80"]
  }
  source_ranges = ["0.0.0.0/0"]
}
# ruleid: gcp-compute-firewall-unrestricted-ingress-3306
resource "google_compute_firewall" "bad3" {
  name    = "allow-mysql-any"
  network = "default"
  allow {
    protocol = "tcp"
    ports    = ["3306"]
  }
  source_ranges = ["0.0.0.0/0"]
  direction     = "INGRESS"
}
# ruleid: gcp-compute-firewall-unrestricted-ingress-3306
resource "google_compute_firewall" "bad4" {
  name    = "allow-mysql-multi"
  network = "default"
  allow {
    protocol = "tcp"
    ports    = ["3306", "3307"]
  }
  source_ranges = ["0.0.0.0/0"]
}
# ok: gcp-compute-firewall-unrestricted-ingress-3306
resource "google_compute_firewall" "good3" {
  name    = "allow-mysql-internal"
  network = "default"
  allow {
    protocol = "tcp"
    ports    = ["3306"]
  }
  source_ranges = ["10.0.0.0/8"]
}
