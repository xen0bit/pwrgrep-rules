# Fixture for azure-storage-blob-service-container-private-access.
# ruleid: azure-storage-blob-service-container-private-access
resource "azurerm_storage_container" "bad1" {
  name = "bad1"
}
# ruleid: azure-storage-blob-service-container-private-access
resource "azurerm_storage_container" "bad2" {
  name = "bad2"
}
# ok: azure-storage-blob-service-container-private-access
resource "azurerm_storage_container" "good1" {
container_access_type = "private"
}
# ok: azure-storage-blob-service-container-private-access
resource "azurerm_storage_container" "good2" {
container_access_type = "private"
}
