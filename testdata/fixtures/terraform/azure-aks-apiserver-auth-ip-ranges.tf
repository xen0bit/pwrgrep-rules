# Fixture for azure-aks-apiserver-auth-ip-ranges.
# ruleid: azure-aks-apiserver-auth-ip-ranges
resource "azurerm_kubernetes_cluster" "bad1" {
  name = "bad1"
}
# ruleid: azure-aks-apiserver-auth-ip-ranges
resource "azurerm_kubernetes_cluster" "bad2" {
  name = "bad2"
}
# ok: azure-aks-apiserver-auth-ip-ranges
resource "azurerm_kubernetes_cluster" "good1" {
api_server_authorized_ip_ranges = ["good1-val"]
}
# ok: azure-aks-apiserver-auth-ip-ranges
resource "azurerm_kubernetes_cluster" "good2" {
api_server_authorized_ip_ranges = ["good2-val"]
}
