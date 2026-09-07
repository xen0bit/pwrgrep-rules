# Fixture for gcp-postgresql-log-lock-waits.
# ruleid: gcp-postgresql-log-lock-waits
resource "google_sql_database_instance" "bad1" {
  database_flags {
    name  = "log_lock_waits"
    value = "off"
  }
}
# ruleid: gcp-postgresql-log-lock-waits
resource "google_sql_database_instance" "bad2" {
  database_flags {
    name  = "log_lock_waits"
    value = "off"
  }
}
# ok: gcp-postgresql-log-lock-waits
resource "google_sql_database_instance" "good1" {
  database_flags {
    name  = "safe-fixed"
    value = "off"
  }
}
# ok: gcp-postgresql-log-lock-waits
resource "google_sql_database_instance" "good2" {
  name = "good2"
}
