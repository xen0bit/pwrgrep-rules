# Fixture for azure-sqlserver-public-access-disabled.
# ruleid: azure-sqlserver-public-access-disabled
resource "azurerm_mssql_server" "bad1" {
  name = "bad1"
}
# ruleid: azure-sqlserver-public-access-disabled
resource "azurerm_mssql_server" "bad2" {
  name = "bad2"
}
# ok: azure-sqlserver-public-access-disabled
resource "azurerm_mssql_server" "good1" {
public_network_access_enabled = false
}
# ok: azure-sqlserver-public-access-disabled
resource "azurerm_mssql_server" "good2" {
public_network_access_enabled = false
}
