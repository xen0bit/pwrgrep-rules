# Fixture for gcp-postgresql-log-disconnection.
# ruleid: gcp-postgresql-log-disconnection
resource "google_sql_database_instance" "bad1" {
  database_flags {
    name  = "log_disconnections"
    value = "off"
  }
}
# ruleid: gcp-postgresql-log-disconnection
resource "google_sql_database_instance" "bad2" {
  database_flags {
    name  = "log_disconnections"
    value = "off"
  }
}
# ok: gcp-postgresql-log-disconnection
resource "google_sql_database_instance" "good1" {
  database_flags {
    name  = "safe-fixed"
    value = "off"
  }
}
# ok: gcp-postgresql-log-disconnection
resource "google_sql_database_instance" "good2" {
  name = "good2"
}
