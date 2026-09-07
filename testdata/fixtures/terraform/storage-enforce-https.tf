# Fixture for storage-enforce-https.
# ruleid: storage-enforce-https
resource "azurerm_storage_account" "bad1" {
  enable_https_traffic_only = false
}
# ruleid: storage-enforce-https
resource "azurerm_storage_account" "bad2" {
  enable_https_traffic_only = false
}
# ok: storage-enforce-https
resource "azurerm_storage_account" "good1" {
  enable_https_traffic_only = true
}
# ok: storage-enforce-https
resource "azurerm_storage_account" "good2" {
  enable_https_traffic_only = true
}
