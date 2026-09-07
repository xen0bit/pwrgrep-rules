# Fixture for azure-defenderon-sqlservers-vms.
# ruleid: azure-defenderon-sqlservers-vms
resource "azurerm_security_center_subscription_pricing" "bad1" {
tier = "Free"
resource_type = "SqlServerVirtualMachines"
}
# ruleid: azure-defenderon-sqlservers-vms
resource "azurerm_security_center_subscription_pricing" "bad2" {
tier = "Free"
resource_type = "SqlServerVirtualMachines"
}
# ok: azure-defenderon-sqlservers-vms
resource "azurerm_security_center_subscription_pricing" "good1" {
tier = "Standard"
resource_type = "SqlServerVirtualMachines"
}
# ok: azure-defenderon-sqlservers-vms
resource "azurerm_security_center_subscription_pricing" "good2" {
tier = "Standard"
resource_type = "SqlServerVirtualMachines"
}
