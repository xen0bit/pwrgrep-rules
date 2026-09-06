# CWE-284: GKE public control plane — no authorized networks.
# ruleid: gcp-gke-public-control-plane
resource "google_container_cluster" "bad1" {
  name     = "bad1"
  location = "us-central1"
}
# ruleid: gcp-gke-public-control-plane
resource "google_container_cluster" "bad2" {
  name     = "bad2"
  location = "us-central1"
  remove_default_node_pool = true
}
# ok: gcp-gke-public-control-plane
resource "google_container_cluster" "good1" {
  name     = "good1"
  location = "us-central1"
  master_authorized_networks_config {
    cidr_blocks {
      cidr_block   = "10.0.0.0/24"
      display_name = "private"
    }
  }
}
# ok: gcp-gke-public-control-plane
resource "google_container_cluster" "good2" {
  name     = "good2"
  location = "us-central1"
  master_authorized_networks_config {
    cidr_blocks {
      cidr_block = "192.168.0.0/16"
    }
  }
  private_cluster_config {
    enable_private_nodes = true
  }
}
# ruleid: gcp-gke-public-control-plane
resource "google_container_cluster" "bad3" {
  name     = "bad3"
  location = "us-central1"
  initial_node_count = 1
}
# ruleid: gcp-gke-public-control-plane
resource "google_container_cluster" "bad4" {
  name     = "bad4"
  location = "us-central1"
  remove_default_node_pool = true
  initial_node_count       = 1
}
# ok: gcp-gke-public-control-plane
resource "google_container_cluster" "good3" {
  name     = "good3"
  location = "us-central1"
  master_authorized_networks_config {
    cidr_blocks {
      cidr_block   = "172.16.0.0/12"
      display_name = "private-net"
    }
  }
  private_cluster_config {
    enable_private_endpoint = true
  }
}
