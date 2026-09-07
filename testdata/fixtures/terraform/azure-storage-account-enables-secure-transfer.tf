# Fixture for azure-storage-account-enables-secure-transfer.
# ruleid: azure-storage-account-enables-secure-transfer
resource "azurerm_storage_account" "bad1" {
enable_https_traffic_only = false
}
# ruleid: azure-storage-account-enables-secure-transfer
resource "azurerm_storage_account" "bad2" {
enable_https_traffic_only = false
}
# ok: azure-storage-account-enables-secure-transfer
resource "azurerm_storage_account" "good1" {
enable_https_traffic_only = true
}
# ok: azure-storage-account-enables-secure-transfer
resource "azurerm_storage_account" "good2" {
  name = "good2"
}
