# Fixture for azure-cosmosdb-disable-access-key-write.
# ruleid: azure-cosmosdb-disable-access-key-write
resource "azurerm_cosmosdb_account" "bad1" {
  name = "bad1"
}
# ruleid: azure-cosmosdb-disable-access-key-write
resource "azurerm_cosmosdb_account" "bad2" {
  name = "bad2"
}
# ok: azure-cosmosdb-disable-access-key-write
resource "azurerm_cosmosdb_account" "good1" {
access_key_metadata_writes_enabled = false
}
# ok: azure-cosmosdb-disable-access-key-write
resource "azurerm_cosmosdb_account" "good2" {
access_key_metadata_writes_enabled = false
}
