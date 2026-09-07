# Fixture for gcp-dataproc-private-cluster-iam-member.
# ruleid: gcp-dataproc-private-cluster-iam-member
resource "google_dataproc_cluster_iam_member" "bad1" {
member = "allUsers"
}
# ruleid: gcp-dataproc-private-cluster-iam-member
resource "google_dataproc_cluster_iam_member" "bad2" {
member = "allAuthenticatedUsers"
}
# ok: gcp-dataproc-private-cluster-iam-member
resource "google_dataproc_cluster_iam_member" "good1" {
member = "safe-fixed"
}
# ok: gcp-dataproc-private-cluster-iam-member
resource "google_dataproc_cluster_iam_member" "good2" {
  name = "good2"
}
