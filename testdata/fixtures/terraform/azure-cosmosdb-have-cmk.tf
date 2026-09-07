# Fixture for azure-cosmosdb-have-cmk.
# ruleid: azure-cosmosdb-have-cmk
resource "azurerm_cosmosdb_account" "bad1" {
  name = "bad1"
}
# ruleid: azure-cosmosdb-have-cmk
resource "azurerm_cosmosdb_account" "bad2" {
  name = "bad2"
}
# ok: azure-cosmosdb-have-cmk
resource "azurerm_cosmosdb_account" "good1" {
key_vault_key_id = "good1-val"
}
# ok: azure-cosmosdb-have-cmk
resource "azurerm_cosmosdb_account" "good2" {
key_vault_key_id = "good2-val"
}
