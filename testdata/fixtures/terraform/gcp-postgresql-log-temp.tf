# Fixture for gcp-postgresql-log-temp.
# ruleid: gcp-postgresql-log-temp
resource "google_sql_database_instance" "bad1" {
  database_flags {
  }
}
# ruleid: gcp-postgresql-log-temp
resource "google_sql_database_instance" "bad2" {
  database_flags {
  }
}
# ok: gcp-postgresql-log-temp
resource "google_sql_database_instance" "good1" {
  database_flags {
    name  = "log_temp_files"
    value = "0"
  }
}
# ok: gcp-postgresql-log-temp
resource "google_sql_database_instance" "good2" {
  database_flags {
    name  = "log_temp_files"
    value = "0"
  }
}
