# Fixture for gcp-dataflow-private-job.
# ruleid: gcp-dataflow-private-job
resource "google_dataflow_job" "bad1" {
  name = "bad1"
}
# ruleid: gcp-dataflow-private-job
resource "google_dataflow_job" "bad2" {
  name = "bad2"
}
# ok: gcp-dataflow-private-job
resource "google_dataflow_job" "good1" {
ip_configuration = "WORKER_IP_PRIVATE"
}
# ok: gcp-dataflow-private-job
resource "google_dataflow_job" "good2" {
ip_configuration = "WORKER_IP_PRIVATE"
}
