# Fixture for gcp-postgresql-log-min-message.
# ruleid: gcp-postgresql-log-min-message
resource "google_sql_database_instance" "bad1" {
  database_flags {
    name  = "log_min_messages"
    value = "ERROR"
  }
}
# ruleid: gcp-postgresql-log-min-message
resource "google_sql_database_instance" "bad2" {
  database_flags {
    name  = "log_min_messages"
    value = "ERROR"
  }
}
# ok: gcp-postgresql-log-min-message
resource "google_sql_database_instance" "good1" {
  database_flags {
    name  = "safe-fixed"
    value = "ERROR"
  }
}
# ok: gcp-postgresql-log-min-message
resource "google_sql_database_instance" "good2" {
  name = "good2"
}
