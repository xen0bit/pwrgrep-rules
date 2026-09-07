# Fixture for azure-storage-account-disable-public-access.
# ruleid: azure-storage-account-disable-public-access
resource "azurerm_storage_account" "bad1" {
allow_blob_public_access = true
}
# ruleid: azure-storage-account-disable-public-access
resource "azurerm_storage_account" "bad2" {
allow_blob_public_access = true
}
# ok: azure-storage-account-disable-public-access
resource "azurerm_storage_account" "good1" {
allow_blob_public_access = false
}
# ok: azure-storage-account-disable-public-access
resource "azurerm_storage_account" "good2" {
  name = "good2"
}
