# Fixture for azure-cosmosdb-accounts-restricted-access.
# ruleid: azure-cosmosdb-accounts-restricted-access
resource "azurerm_cosmosdb_account" "bad1" {
  name = "bad1"
}
# ruleid: azure-cosmosdb-accounts-restricted-access
resource "azurerm_cosmosdb_account" "bad2" {
  name = "bad2"
}
# ok: azure-cosmosdb-accounts-restricted-access
resource "azurerm_cosmosdb_account" "good1" {
public_network_access_enabled = false
}
# ok: azure-cosmosdb-accounts-restricted-access
resource "azurerm_cosmosdb_account" "good2" {
is_virtual_network_filter_enabled = true
virtual_network_rule = "good2-val"
}
