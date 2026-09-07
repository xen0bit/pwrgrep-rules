# Fixture for azure-postgresql-geo-backup-enabled.
# ruleid: azure-postgresql-geo-backup-enabled
resource "azurerm_postgresql_server" "bad1" {
  name = "bad1"
}
# ruleid: azure-postgresql-geo-backup-enabled
resource "azurerm_postgresql_server" "bad2" {
  name = "bad2"
}
# ok: azure-postgresql-geo-backup-enabled
resource "azurerm_postgresql_server" "good1" {
geo_redundant_backup_enabled = true
}
# ok: azure-postgresql-geo-backup-enabled
resource "azurerm_postgresql_server" "good2" {
geo_redundant_backup_enabled = true
}
