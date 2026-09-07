# Fixture for azure-postgresql-encryption-enabled.
# ruleid: azure-postgresql-encryption-enabled
resource "azurerm_postgresql_server" "bad1" {
  name = "bad1"
}
# ruleid: azure-postgresql-encryption-enabled
resource "azurerm_postgresql_server" "bad2" {
  name = "bad2"
}
# ok: azure-postgresql-encryption-enabled
resource "azurerm_postgresql_server" "good1" {
infrastructure_encryption_enabled = true
}
# ok: azure-postgresql-encryption-enabled
resource "azurerm_postgresql_server" "good2" {
infrastructure_encryption_enabled = true
}
