# Fixture for azure-mysql-geo-backup-enabled.
# ruleid: azure-mysql-geo-backup-enabled
resource "azurerm_mysql_server" "bad1" {
  name = "bad1"
}
# ruleid: azure-mysql-geo-backup-enabled
resource "azurerm_mysql_server" "bad2" {
  name = "bad2"
}
# ok: azure-mysql-geo-backup-enabled
resource "azurerm_mysql_server" "good1" {
geo_redundant_backup_enabled = true
}
# ok: azure-mysql-geo-backup-enabled
resource "azurerm_mysql_server" "good2" {
geo_redundant_backup_enabled = true
}
