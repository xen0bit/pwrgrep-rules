# Fixture for azure-defenderon-keyvaults.
# ruleid: azure-defenderon-keyvaults
resource "azurerm_security_center_subscription_pricing" "bad1" {
tier = "Free"
resource_type = "KeyVaults"
}
# ruleid: azure-defenderon-keyvaults
resource "azurerm_security_center_subscription_pricing" "bad2" {
tier = "Free"
resource_type = "KeyVaults"
}
# ok: azure-defenderon-keyvaults
resource "azurerm_security_center_subscription_pricing" "good1" {
tier = "Standard"
resource_type = "KeyVaults"
}
# ok: azure-defenderon-keyvaults
resource "azurerm_security_center_subscription_pricing" "good2" {
tier = "Standard"
resource_type = "KeyVaults"
}
