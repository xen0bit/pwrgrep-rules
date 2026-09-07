# Fixture for gcp-spanner-database-encrypted-with-cmk.
# ruleid: gcp-spanner-database-encrypted-with-cmk
resource "google_spanner_database" "bad1" {
}
# ruleid: gcp-spanner-database-encrypted-with-cmk
resource "google_spanner_database" "bad2" {
}
# ok: gcp-spanner-database-encrypted-with-cmk
resource "google_spanner_database" "good1" {
  encryption_config {
    kms_key_name = "good1-val"
  }
}
# ok: gcp-spanner-database-encrypted-with-cmk
resource "google_spanner_database" "good2" {
  encryption_config {
    kms_key_name = "good2-val"
  }
}
