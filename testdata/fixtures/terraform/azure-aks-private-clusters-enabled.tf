# Fixture for azure-aks-private-clusters-enabled.
# ruleid: azure-aks-private-clusters-enabled
resource "azurerm_kubernetes_cluster" "bad1" {
  name = "bad1"
}
# ruleid: azure-aks-private-clusters-enabled
resource "azurerm_kubernetes_cluster" "bad2" {
  name = "bad2"
}
# ok: azure-aks-private-clusters-enabled
resource "azurerm_kubernetes_cluster" "good1" {
private_cluster_enabled = true
}
# ok: azure-aks-private-clusters-enabled
resource "azurerm_kubernetes_cluster" "good2" {
private_cluster_enabled = true
}
