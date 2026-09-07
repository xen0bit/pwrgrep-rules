# Fixture for gcp-dataproc-private-cluster-iam-binding.
# ruleid: gcp-dataproc-private-cluster-iam-binding
resource "google_dataproc_cluster_iam_binding" "bad1" {
members = [ "allAuthenticatedUsers"]
}
# ruleid: gcp-dataproc-private-cluster-iam-binding
resource "google_dataproc_cluster_iam_binding" "bad2" {
members = [ "allUsers"]
}
# ok: gcp-dataproc-private-cluster-iam-binding
resource "google_dataproc_cluster_iam_binding" "good1" {
members = [ "user:good@example.com"]
}
# ok: gcp-dataproc-private-cluster-iam-binding
resource "google_dataproc_cluster_iam_binding" "good2" {
  name = "good2"
}
