# Fixture for azure-postgresql-flexi-server-geo-backup-enabled.
# ruleid: azure-postgresql-flexi-server-geo-backup-enabled
resource "azurerm_postgresql_flexible_server" "bad1" {
  name = "bad1"
}
# ruleid: azure-postgresql-flexi-server-geo-backup-enabled
resource "azurerm_postgresql_flexible_server" "bad2" {
  name = "bad2"
}
# ok: azure-postgresql-flexi-server-geo-backup-enabled
resource "azurerm_postgresql_flexible_server" "good1" {
geo_redundant_backup_enabled = true
}
# ok: azure-postgresql-flexi-server-geo-backup-enabled
resource "azurerm_postgresql_flexible_server" "good2" {
geo_redundant_backup_enabled = true
}
