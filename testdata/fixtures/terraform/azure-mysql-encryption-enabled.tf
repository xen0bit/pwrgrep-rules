# Fixture for azure-mysql-encryption-enabled.
# ruleid: azure-mysql-encryption-enabled
resource "azurerm_mysql_server" "bad1" {
  name = "bad1"
}
# ruleid: azure-mysql-encryption-enabled
resource "azurerm_mysql_server" "bad2" {
  name = "bad2"
}
# ok: azure-mysql-encryption-enabled
resource "azurerm_mysql_server" "good1" {
infrastructure_encryption_enabled = true
}
# ok: azure-mysql-encryption-enabled
resource "azurerm_mysql_server" "good2" {
infrastructure_encryption_enabled = true
}
