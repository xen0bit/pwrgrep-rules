# Fixture for azure-defenderon-storage.
# ruleid: azure-defenderon-storage
resource "azurerm_security_center_subscription_pricing" "bad1" {
tier = "Free"
resource_type = "StorageAccounts"
}
# ruleid: azure-defenderon-storage
resource "azurerm_security_center_subscription_pricing" "bad2" {
tier = "Free"
resource_type = "StorageAccounts"
}
# ok: azure-defenderon-storage
resource "azurerm_security_center_subscription_pricing" "good1" {
tier = "Standard"
resource_type = "StorageAccounts"
}
# ok: azure-defenderon-storage
resource "azurerm_security_center_subscription_pricing" "good2" {
tier = "Standard"
resource_type = "StorageAccounts"
}
