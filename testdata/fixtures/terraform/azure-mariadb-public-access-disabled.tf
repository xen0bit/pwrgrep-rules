# Fixture for azure-mariadb-public-access-disabled.
# ruleid: azure-mariadb-public-access-disabled
resource "azurerm_mariadb_server" "bad1" {
  name = "bad1"
}
# ruleid: azure-mariadb-public-access-disabled
resource "azurerm_mariadb_server" "bad2" {
  name = "bad2"
}
# ok: azure-mariadb-public-access-disabled
resource "azurerm_mariadb_server" "good1" {
public_network_access_enabled = false
}
# ok: azure-mariadb-public-access-disabled
resource "azurerm_mariadb_server" "good2" {
public_network_access_enabled = false
}
