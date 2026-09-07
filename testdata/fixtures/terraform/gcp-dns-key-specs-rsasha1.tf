# Fixture for gcp-dns-key-specs-rsasha1.
# ruleid: gcp-dns-key-specs-rsasha1
resource "google_dns_managed_zone" "bad1" {
  dnssec_config {
    default_key_specs {
      algorithm = "rsasha1"
      key_type = "keySigning"
    }
    default_key_specs {
      algorithm = "rsasha1"
      key_type = "zoneSigning"
    }
  }
}
# ruleid: gcp-dns-key-specs-rsasha1
resource "google_dns_managed_zone" "bad2" {
  dnssec_config {
    default_key_specs {
      algorithm = "rsasha1"
      key_type = "zoneSigning"
    }
    default_key_specs {
      algorithm = "rsasha1"
      key_type = "keySigning"
    }
  }
}
# ok: gcp-dns-key-specs-rsasha1
resource "google_dns_managed_zone" "good1" {
  dnssec_config {
    default_key_specs {
      algorithm = "rsasha256"
      key_type = "keySigning"
    }
    default_key_specs {
      algorithm = "rsasha256"
      key_type = "zoneSigning"
    }
  }
}
# ok: gcp-dns-key-specs-rsasha1
resource "google_dns_managed_zone" "good2" {
  name = "good2"
}
