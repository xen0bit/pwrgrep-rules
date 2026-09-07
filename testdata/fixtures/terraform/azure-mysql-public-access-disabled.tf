# Fixture for azure-mysql-public-access-disabled.
# ruleid: azure-mysql-public-access-disabled
resource "azurerm_mysql_server" "bad1" {
  name = "bad1"
}
# ruleid: azure-mysql-public-access-disabled
resource "azurerm_mysql_server" "bad2" {
  name = "bad2"
}
# ok: azure-mysql-public-access-disabled
resource "azurerm_mysql_server" "good1" {
public_network_access_enabled = false
}
# ok: azure-mysql-public-access-disabled
resource "azurerm_mysql_server" "good2" {
public_network_access_enabled = false
}
