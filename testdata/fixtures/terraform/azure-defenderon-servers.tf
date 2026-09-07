# Fixture for azure-defenderon-servers.
# ruleid: azure-defenderon-servers
resource "azurerm_security_center_subscription_pricing" "bad1" {
tier = "Free"
resource_type = "VirtualMachines"
}
# ruleid: azure-defenderon-servers
resource "azurerm_security_center_subscription_pricing" "bad2" {
tier = "Free"
resource_type = "VirtualMachines"
}
# ok: azure-defenderon-servers
resource "azurerm_security_center_subscription_pricing" "good1" {
tier = "Standard"
resource_type = "VirtualMachines"
}
# ok: azure-defenderon-servers
resource "azurerm_security_center_subscription_pricing" "good2" {
tier = "Standard"
resource_type = "VirtualMachines"
}
