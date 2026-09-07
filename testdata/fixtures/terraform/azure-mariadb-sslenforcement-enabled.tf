# Fixture for azure-mariadb-sslenforcement-enabled.
# ruleid: azure-mariadb-sslenforcement-enabled
resource "azurerm_mariadb_server" "bad1" {
  name = "bad1"
}
# ruleid: azure-mariadb-sslenforcement-enabled
resource "azurerm_mariadb_server" "bad2" {
  name = "bad2"
}
# ok: azure-mariadb-sslenforcement-enabled
resource "azurerm_mariadb_server" "good1" {
ssl_enforcement_enabled = true
}
# ok: azure-mariadb-sslenforcement-enabled
resource "azurerm_mariadb_server" "good2" {
ssl_enforcement_enabled = true
}
