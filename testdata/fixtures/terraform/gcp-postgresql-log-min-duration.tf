# Fixture for gcp-postgresql-log-min-duration.
# ruleid: gcp-postgresql-log-min-duration
resource "google_sql_database_instance" "bad1" {
  database_flags {
  }
}
# ruleid: gcp-postgresql-log-min-duration
resource "google_sql_database_instance" "bad2" {
  database_flags {
  }
}
# ok: gcp-postgresql-log-min-duration
resource "google_sql_database_instance" "good1" {
  database_flags {
    name  = "log_min_duration_statement"
    value = "-1"
  }
}
# ok: gcp-postgresql-log-min-duration
resource "google_sql_database_instance" "good2" {
  database_flags {
    name  = "log_min_duration_statement"
    value = "-1"
  }
}
