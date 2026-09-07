# Fixture for azure-defenderon-sqlservers.
# ruleid: azure-defenderon-sqlservers
resource "azurerm_security_center_subscription_pricing" "bad1" {
tier = "Free"
resource_type = "SqlServers"
}
# ruleid: azure-defenderon-sqlservers
resource "azurerm_security_center_subscription_pricing" "bad2" {
tier = "Free"
resource_type = "SqlServers"
}
# ok: azure-defenderon-sqlservers
resource "azurerm_security_center_subscription_pricing" "good1" {
tier = "Standard"
resource_type = "SqlServers"
}
# ok: azure-defenderon-sqlservers
resource "azurerm_security_center_subscription_pricing" "good2" {
tier = "Standard"
resource_type = "SqlServers"
}
