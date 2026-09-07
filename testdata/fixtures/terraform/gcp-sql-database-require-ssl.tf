# Fixture for gcp-sql-database-require-ssl.
# ruleid: gcp-sql-database-require-ssl
resource "google_sql_database_instance" "bad1" {
  name = "bad1"
}
# ruleid: gcp-sql-database-require-ssl
resource "google_sql_database_instance" "bad2" {
  name = "bad2"
}
# ok: gcp-sql-database-require-ssl
resource "google_sql_database_instance" "good1" {
    ip_configuration {
        require_ssl = true
    }
}
# ok: gcp-sql-database-require-ssl
resource "google_sql_database_instance" "good2" {
    ip_configuration {
        ssl_mode = "good2-val"
    }
}
