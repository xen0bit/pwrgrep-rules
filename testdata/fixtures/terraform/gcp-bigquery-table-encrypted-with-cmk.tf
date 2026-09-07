# Fixture for gcp-bigquery-table-encrypted-with-cmk.
# ruleid: gcp-bigquery-table-encrypted-with-cmk
resource "google_bigquery_table" "bad1" {
}
# ruleid: gcp-bigquery-table-encrypted-with-cmk
resource "google_bigquery_table" "bad2" {
}
# ok: gcp-bigquery-table-encrypted-with-cmk
resource "google_bigquery_table" "good1" {
  encryption_configuration {
    kms_key_name = "good1-val"
  }
}
# ok: gcp-bigquery-table-encrypted-with-cmk
resource "google_bigquery_table" "good2" {
  encryption_configuration {
    kms_key_name = "good2-val"
  }
}
