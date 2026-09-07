# Fixture for gcp-postgresql-log-checkpoints.
# ruleid: gcp-postgresql-log-checkpoints
resource "google_sql_database_instance" "bad1" {
  database_flags {
    name  = "log_checkpoints"
    value = "off"
  }
}
# ruleid: gcp-postgresql-log-checkpoints
resource "google_sql_database_instance" "bad2" {
  database_flags {
    name  = "log_checkpoints"
    value = "off"
  }
}
# ok: gcp-postgresql-log-checkpoints
resource "google_sql_database_instance" "good1" {
  database_flags {
    name  = "safe-fixed"
    value = "off"
  }
}
# ok: gcp-postgresql-log-checkpoints
resource "google_sql_database_instance" "good2" {
  name = "good2"
}
