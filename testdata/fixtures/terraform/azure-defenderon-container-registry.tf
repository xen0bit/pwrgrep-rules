# Fixture for azure-defenderon-container-registry.
# ruleid: azure-defenderon-container-registry
resource "azurerm_security_center_subscription_pricing" "bad1" {
tier = "Free"
resource_type = "ContainerRegistry"
}
# ruleid: azure-defenderon-container-registry
resource "azurerm_security_center_subscription_pricing" "bad2" {
tier = "Free"
resource_type = "ContainerRegistry"
}
# ok: azure-defenderon-container-registry
resource "azurerm_security_center_subscription_pricing" "good1" {
tier = "Standard"
resource_type = "ContainerRegistry"
}
# ok: azure-defenderon-container-registry
resource "azurerm_security_center_subscription_pricing" "good2" {
tier = "Standard"
resource_type = "ContainerRegistry"
}
