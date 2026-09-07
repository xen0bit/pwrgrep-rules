# Fixture for azure-instance-extensions.
# ruleid: azure-instance-extensions
resource "azurerm_linux_virtual_machine" "bad1" {
  name = "bad1"
}
# ruleid: azure-instance-extensions
resource "azurerm_windows_virtual_machine" "bad2" {
  name = "bad2"
}
# ok: azure-instance-extensions
resource "azurerm_linux_virtual_machine" "good1" {
allow_extension_operations = false
}
# ok: azure-instance-extensions
resource "azurerm_windows_virtual_machine" "good2" {
allow_extension_operations = false
}
