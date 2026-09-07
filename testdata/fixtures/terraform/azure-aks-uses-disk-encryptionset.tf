# Fixture for azure-aks-uses-disk-encryptionset.
# ruleid: azure-aks-uses-disk-encryptionset
resource "azurerm_kubernetes_cluster" "bad1" {
  name = "bad1"
}
# ruleid: azure-aks-uses-disk-encryptionset
resource "azurerm_kubernetes_cluster" "bad2" {
  name = "bad2"
}
# ok: azure-aks-uses-disk-encryptionset
resource "azurerm_kubernetes_cluster" "good1" {
disk_encryption_set_id = "good1-val"
}
# ok: azure-aks-uses-disk-encryptionset
resource "azurerm_kubernetes_cluster" "good2" {
disk_encryption_set_id = "good2-val"
}
