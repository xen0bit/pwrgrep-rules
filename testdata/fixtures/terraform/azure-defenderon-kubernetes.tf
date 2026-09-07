# Fixture for azure-defenderon-kubernetes.
# ruleid: azure-defenderon-kubernetes
resource "azurerm_security_center_subscription_pricing" "bad1" {
tier = "Free"
resource_type = "KubernetesService"
}
# ruleid: azure-defenderon-kubernetes
resource "azurerm_security_center_subscription_pricing" "bad2" {
tier = "Free"
resource_type = "KubernetesService"
}
# ok: azure-defenderon-kubernetes
resource "azurerm_security_center_subscription_pricing" "good1" {
tier = "Standard"
resource_type = "KubernetesService"
}
# ok: azure-defenderon-kubernetes
resource "azurerm_security_center_subscription_pricing" "good2" {
tier = "Standard"
resource_type = "KubernetesService"
}
