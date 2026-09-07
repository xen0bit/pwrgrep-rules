# Fixture for azure-aks-uses-azure-policies-addon.
# ruleid: azure-aks-uses-azure-policies-addon
resource "azurerm_kubernetes_cluster" "bad1" {
  name = "bad1"
}
# ruleid: azure-aks-uses-azure-policies-addon
resource "azurerm_kubernetes_cluster" "bad2" {
  name = "bad2"
}
# ok: azure-aks-uses-azure-policies-addon
resource "azurerm_kubernetes_cluster" "good1" {
addon_profile {
  azure_policy {
    enabled = true
  }
}
}
# ok: azure-aks-uses-azure-policies-addon
resource "azurerm_kubernetes_cluster" "good2" {
addon_profile {
  azure_policy {
    enabled = true
  }
}
}
