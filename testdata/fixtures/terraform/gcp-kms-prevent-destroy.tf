# Fixture for gcp-kms-prevent-destroy.
# ruleid: gcp-kms-prevent-destroy
resource "google_kms_crypto_key" "bad1" {
  name = "bad1"
}
# ruleid: gcp-kms-prevent-destroy
resource "google_kms_crypto_key" "bad2" {
  name = "bad2"
}
# ok: gcp-kms-prevent-destroy
resource "google_kms_crypto_key" "good1" {
  lifecycle {
    prevent_destroy = true
  }
}
# ok: gcp-kms-prevent-destroy
resource "google_kms_crypto_key" "good2" {
  lifecycle {
    prevent_destroy = true
  }
}
