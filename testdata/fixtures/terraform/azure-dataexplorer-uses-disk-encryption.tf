# Fixture for azure-dataexplorer-uses-disk-encryption.
# ruleid: azure-dataexplorer-uses-disk-encryption
resource "azurerm_kusto_cluster" "bad1" {
  name = "bad1"
}
# ruleid: azure-dataexplorer-uses-disk-encryption
resource "azurerm_kusto_cluster" "bad2" {
  name = "bad2"
}
# ok: azure-dataexplorer-uses-disk-encryption
resource "azurerm_kusto_cluster" "good1" {
enable_disk_encryption = true
}
# ok: azure-dataexplorer-uses-disk-encryption
resource "azurerm_kusto_cluster" "good2" {
enable_disk_encryption = true
}
