# Fixture for azure-postgresql-server-public-access-disabled.
# ruleid: azure-postgresql-server-public-access-disabled
resource "azurerm_postgresql_server" "bad1" {
  name = "bad1"
}
# ruleid: azure-postgresql-server-public-access-disabled
resource "azurerm_postgresql_server" "bad2" {
  name = "bad2"
}
# ok: azure-postgresql-server-public-access-disabled
resource "azurerm_postgresql_server" "good1" {
public_network_access_enabled = false
}
# ok: azure-postgresql-server-public-access-disabled
resource "azurerm_postgresql_server" "good2" {
public_network_access_enabled = false
}
