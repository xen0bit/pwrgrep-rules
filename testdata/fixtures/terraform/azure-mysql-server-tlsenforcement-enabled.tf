# Fixture for azure-mysql-server-tlsenforcement-enabled.
# ruleid: azure-mysql-server-tlsenforcement-enabled
resource "azurerm_mysql_server" "bad1" {
  name = "bad1"
}
# ruleid: azure-mysql-server-tlsenforcement-enabled
resource "azurerm_mysql_server" "bad2" {
  name = "bad2"
}
# ok: azure-mysql-server-tlsenforcement-enabled
resource "azurerm_mysql_server" "good1" {
ssl_enforcement_enabled = true
}
# ok: azure-mysql-server-tlsenforcement-enabled
resource "azurerm_mysql_server" "good2" {
ssl_enforcement_enabled = true
}
