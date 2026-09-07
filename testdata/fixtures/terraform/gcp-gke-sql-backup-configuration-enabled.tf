# Fixture for gcp-gke-sql-backup-configuration-enabled.
# ruleid: gcp-gke-sql-backup-configuration-enabled
resource "google_sql_database_instance" "bad1" {
  name = "bad1"
}
# ruleid: gcp-gke-sql-backup-configuration-enabled
resource "google_sql_database_instance" "bad2" {
  name = "bad2"
}
# ok: gcp-gke-sql-backup-configuration-enabled
resource "google_sql_database_instance" "good1" {
settings {
  backup_configuration {
    enabled = true
  }
}
}
# ok: gcp-gke-sql-backup-configuration-enabled
resource "google_sql_database_instance" "good2" {
settings {
  backup_configuration {
    enabled = true
  }
}
}
