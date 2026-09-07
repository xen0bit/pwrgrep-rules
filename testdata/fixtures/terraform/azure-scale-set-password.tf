# Fixture for azure-scale-set-password.
# ruleid: azure-scale-set-password
resource "azurerm_linux_virtual_machine_scale_set" "bad1" {
  name = "bad1"
}
# ruleid: azure-scale-set-password
resource "azurerm_linux_virtual_machine_scale_set" "bad2" {
  name = "bad2"
}
# ok: azure-scale-set-password
resource "azurerm_linux_virtual_machine_scale_set" "good1" {
disable_password_authentication = true
}
# ok: azure-scale-set-password
resource "azurerm_linux_virtual_machine_scale_set" "good2" {
disable_password_authentication = true
}
