# Fixture for gcp-bigtable-instance-encrypted-with-cmk.
# ruleid: gcp-bigtable-instance-encrypted-with-cmk
resource "google_bigtable_instance" "bad1" {
}
# ruleid: gcp-bigtable-instance-encrypted-with-cmk
resource "google_bigtable_instance" "bad2" {
}
# ok: gcp-bigtable-instance-encrypted-with-cmk
resource "google_bigtable_instance" "good1" {
  cluster {
    kms_key_name = "good1-val"
  }
}
# ok: gcp-bigtable-instance-encrypted-with-cmk
resource "google_bigtable_instance" "good2" {
  cluster {
    kms_key_name = "good2-val"
  }
}
