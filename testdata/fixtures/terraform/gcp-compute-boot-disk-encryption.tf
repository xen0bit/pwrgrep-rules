# Fixture for gcp-compute-boot-disk-encryption.
# ruleid: gcp-compute-boot-disk-encryption
resource "google_compute_instance" "bad1" {
}
# ruleid: gcp-compute-boot-disk-encryption
resource "google_compute_instance" "bad2" {
}
# ok: gcp-compute-boot-disk-encryption
resource "google_compute_instance" "good1" {
  boot_disk {
    disk_encryption_key_raw = "good1-val"
  }
}
# ok: gcp-compute-boot-disk-encryption
resource "google_compute_instance" "good2" {
  boot_disk {
    kms_key_self_link = "good2-val"
  }
}
