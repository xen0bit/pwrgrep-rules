# Fixture for gcp-bigquery-dataset-encrypted-with-cmk.
# ruleid: gcp-bigquery-dataset-encrypted-with-cmk
resource "google_bigquery_dataset" "bad1" {
}
# ruleid: gcp-bigquery-dataset-encrypted-with-cmk
resource "google_bigquery_dataset" "bad2" {
}
# ok: gcp-bigquery-dataset-encrypted-with-cmk
resource "google_bigquery_dataset" "good1" {
  default_encryption_configuration {
    kms_key_name = "good1-val"
  }
}
# ok: gcp-bigquery-dataset-encrypted-with-cmk
resource "google_bigquery_dataset" "good2" {
  default_encryption_configuration {
    kms_key_name = "good2-val"
  }
}
