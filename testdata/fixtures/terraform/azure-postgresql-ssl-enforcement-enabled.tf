# Fixture for azure-postgresql-ssl-enforcement-enabled.
# ruleid: azure-postgresql-ssl-enforcement-enabled
resource "azurerm_postgresql_server" "bad1" {
  name = "bad1"
}
# ruleid: azure-postgresql-ssl-enforcement-enabled
resource "azurerm_postgresql_server" "bad2" {
  name = "bad2"
}
# ok: azure-postgresql-ssl-enforcement-enabled
resource "azurerm_postgresql_server" "good1" {
ssl_enforcement_enabled = true
}
# ok: azure-postgresql-ssl-enforcement-enabled
resource "azurerm_postgresql_server" "good2" {
ssl_enforcement_enabled = true
}
