# Fixture for azure-postgresql-server-connection-throttling-enabled.
# ruleid: azure-postgresql-server-connection-throttling-enabled
resource "azurerm_postgresql_configuration" "bad1" {
  name = "bad1"
}
# ruleid: azure-postgresql-server-connection-throttling-enabled
resource "azurerm_postgresql_configuration" "bad2" {
  name = "bad2"
}
# ok: azure-postgresql-server-connection-throttling-enabled
resource "azurerm_postgresql_configuration" "good1" {
name = "connection_throttling"
value = "on"
}
# ok: azure-postgresql-server-connection-throttling-enabled
resource "azurerm_postgresql_configuration" "good2" {
name = "connection_throttling"
value = "on"
}
