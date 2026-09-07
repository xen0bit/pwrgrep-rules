# Fixture for gcp-dataproc-cluster-encrypted-with-cmk.
# ruleid: gcp-dataproc-cluster-encrypted-with-cmk
resource "google_dataproc_cluster" "bad1" {
}
# ruleid: gcp-dataproc-cluster-encrypted-with-cmk
resource "google_dataproc_cluster" "bad2" {
}
# ok: gcp-dataproc-cluster-encrypted-with-cmk
resource "google_dataproc_cluster" "good1" {
  cluster_config {
    encryption_config {
      kms_key_name = "good1-val"
    }
  }
}
# ok: gcp-dataproc-cluster-encrypted-with-cmk
resource "google_dataproc_cluster" "good2" {
  cluster_config {
    encryption_config {
      kms_key_name = "good2-val"
    }
  }
}
