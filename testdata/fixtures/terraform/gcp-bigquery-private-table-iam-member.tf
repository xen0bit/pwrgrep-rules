# Fixture for gcp-bigquery-private-table-iam-member.
# ruleid: gcp-bigquery-private-table-iam-member
resource "google_bigquery_table_iam_member" "bad1" {
member = "allAuthenticatedUsers"
}
# ruleid: gcp-bigquery-private-table-iam-member
resource "google_bigquery_table_iam_member" "bad2" {
member = "allUsers"
}
# ok: gcp-bigquery-private-table-iam-member
resource "google_bigquery_table_iam_member" "good1" {
member = "safe-fixed"
}
# ok: gcp-bigquery-private-table-iam-member
resource "google_bigquery_table_iam_member" "good2" {
  name = "good2"
}
