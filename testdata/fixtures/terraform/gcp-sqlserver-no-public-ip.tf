# Fixture for gcp-sqlserver-no-public-ip.
# ruleid: gcp-sqlserver-no-public-ip
resource "google_sql_database_instance" "bad1" {
ip_configuration {
  ipv4_enabled = true
}
}
# ruleid: gcp-sqlserver-no-public-ip
resource "google_sql_database_instance" "bad2" {
ip_configuration {
  ipv4_enabled = true
}
}
# ok: gcp-sqlserver-no-public-ip
resource "google_sql_database_instance" "good1" {
ip_configuration {
  ipv4_enabled = false
}
}
# ok: gcp-sqlserver-no-public-ip
resource "google_sql_database_instance" "good2" {
  name = "good2"
}
