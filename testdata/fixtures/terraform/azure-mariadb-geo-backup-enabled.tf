# Fixture for azure-mariadb-geo-backup-enabled.
# ruleid: azure-mariadb-geo-backup-enabled
resource "azurerm_mariadb_server" "bad1" {
  name = "bad1"
}
# ruleid: azure-mariadb-geo-backup-enabled
resource "azurerm_mariadb_server" "bad2" {
  name = "bad2"
}
# ok: azure-mariadb-geo-backup-enabled
resource "azurerm_mariadb_server" "good1" {
geo_redundant_backup_enabled = true
}
# ok: azure-mariadb-geo-backup-enabled
resource "azurerm_mariadb_server" "good2" {
geo_redundant_backup_enabled = true
}
