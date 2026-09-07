# Fixture for gcp-dataproc-cluster-public-ip.
# ruleid: gcp-dataproc-cluster-public-ip
resource "google_dataproc_cluster" "bad1" {
  name = "bad1"
}
# ruleid: gcp-dataproc-cluster-public-ip
resource "google_dataproc_cluster" "bad2" {
  name = "bad2"
}
# ok: gcp-dataproc-cluster-public-ip
resource "google_dataproc_cluster" "good1" {
  cluster_config {
    gce_cluster_config {
      internal_ip_only = true
    }
  }
}
# ok: gcp-dataproc-cluster-public-ip
resource "google_dataproc_cluster" "good2" {
  cluster_config {
    gce_cluster_config {
      internal_ip_only = true
    }
  }
}
