# Fixture for azure-storage-sync-public-access-disabled.
# ruleid: azure-storage-sync-public-access-disabled
resource "azurerm_storage_sync" "bad1" {
  name = "bad1"
}
# ruleid: azure-storage-sync-public-access-disabled
resource "azurerm_storage_sync" "bad2" {
  name = "bad2"
}
# ok: azure-storage-sync-public-access-disabled
resource "azurerm_storage_sync" "good1" {
incoming_traffic_policy = AllowVirtualNetworksOnly
}
# ok: azure-storage-sync-public-access-disabled
resource "azurerm_storage_sync" "good2" {
incoming_traffic_policy = AllowVirtualNetworksOnly
}
