# Fixture for azure-dataexplorer-double-encryption-enabled.
# ruleid: azure-dataexplorer-double-encryption-enabled
resource "azurerm_kusto_cluster" "bad1" {
  name = "bad1"
}
# ruleid: azure-dataexplorer-double-encryption-enabled
resource "azurerm_kusto_cluster" "bad2" {
  name = "bad2"
}
# ok: azure-dataexplorer-double-encryption-enabled
resource "azurerm_kusto_cluster" "good1" {
double_encryption_enabled = true
}
# ok: azure-dataexplorer-double-encryption-enabled
resource "azurerm_kusto_cluster" "good2" {
double_encryption_enabled = true
}
