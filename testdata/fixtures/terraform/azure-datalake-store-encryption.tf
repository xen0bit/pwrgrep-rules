# Fixture for azure-datalake-store-encryption.
# ruleid: azure-datalake-store-encryption
resource "azurerm_data_lake_store" "bad1" {
  name = "bad1"
}
# ruleid: azure-datalake-store-encryption
resource "azurerm_data_lake_store" "bad2" {
  name = "bad2"
}
# ok: azure-datalake-store-encryption
resource "azurerm_data_lake_store" "good1" {
encryption_state = "Enabled"
}
# ok: azure-datalake-store-encryption
resource "azurerm_data_lake_store" "good2" {
encryption_state = "Enabled"
}
