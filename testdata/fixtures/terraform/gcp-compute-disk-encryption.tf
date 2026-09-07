# Fixture for gcp-compute-disk-encryption.
# ruleid: gcp-compute-disk-encryption
resource "google_compute_disk" "bad1" {
}
# ruleid: gcp-compute-disk-encryption
resource "google_compute_disk" "bad2" {
}
# ok: gcp-compute-disk-encryption
resource "google_compute_disk" "good1" {
  disk_encryption_key {
    raw_key = "good1-val"
  }
}
# ok: gcp-compute-disk-encryption
resource "google_compute_disk" "good2" {
  disk_encryption_key {
    kms_key_self_link = "good2-val"
  }
}
