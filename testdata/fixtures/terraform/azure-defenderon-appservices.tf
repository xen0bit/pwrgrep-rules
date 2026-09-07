# Fixture for azure-defenderon-appservices.
# ruleid: azure-defenderon-appservices
resource "azurerm_security_center_subscription_pricing" "bad1" {
tier = "Free"
resource_type = "AppServices"
}
# ruleid: azure-defenderon-appservices
resource "azurerm_security_center_subscription_pricing" "bad2" {
tier = "Free"
resource_type = "AppServices"
}
# ok: azure-defenderon-appservices
resource "azurerm_security_center_subscription_pricing" "good1" {
tier = "Standard"
resource_type = "AppServices"
}
# ok: azure-defenderon-appservices
resource "azurerm_security_center_subscription_pricing" "good2" {
tier = "Standard"
resource_type = "AppServices"
}
