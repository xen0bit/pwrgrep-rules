# Fixture for gcp-dataflow-job-encrypted-with-cmk.
# ruleid: gcp-dataflow-job-encrypted-with-cmk
resource "google_dataflow_job" "bad1" {
}
# ruleid: gcp-dataflow-job-encrypted-with-cmk
resource "google_dataflow_job" "bad2" {
}
# ok: gcp-dataflow-job-encrypted-with-cmk
resource "google_dataflow_job" "good1" {
  kms_key_name = "good1-val"
}
# ok: gcp-dataflow-job-encrypted-with-cmk
resource "google_dataflow_job" "good2" {
  kms_key_name = "good2-val"
}
