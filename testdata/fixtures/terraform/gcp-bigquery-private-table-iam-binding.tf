# Fixture for gcp-bigquery-private-table-iam-binding.
# ruleid: gcp-bigquery-private-table-iam-binding
resource "google_bigquery_table_iam_binding" "bad1" {
members = [ "allAuthenticatedUsers"]
}
# ruleid: gcp-bigquery-private-table-iam-binding
resource "google_bigquery_table_iam_binding" "bad2" {
members = [ "allUsers"]
}
# ok: gcp-bigquery-private-table-iam-binding
resource "google_bigquery_table_iam_binding" "good1" {
members = [ "user:good@example.com"]
}
# ok: gcp-bigquery-private-table-iam-binding
resource "google_bigquery_table_iam_binding" "good2" {
  name = "good2"
}
