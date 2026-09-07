# Fixture for gcp-mysql-local-in-file-off.
# ruleid: gcp-mysql-local-in-file-off
resource "google_sql_database_instance" "bad1" {
  database_flags {
    name  = "local_infile"
    value = "on"
  }
}
# ruleid: gcp-mysql-local-in-file-off
resource "google_sql_database_instance" "bad2" {
  database_flags {
    name  = "local_infile"
    value = "on"
  }
}
# ok: gcp-mysql-local-in-file-off
resource "google_sql_database_instance" "good1" {
  database_flags {
    name  = "local_infile"
    value = "off"
  }
}
# ok: gcp-mysql-local-in-file-off
resource "google_sql_database_instance" "good2" {
  name = "good2"
}
