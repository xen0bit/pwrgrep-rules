# Fixture for azure-vmencryption-at-host-enabled.
# ruleid: azure-vmencryption-at-host-enabled
resource "azurerm_windows_virtual_machine_scale_set" "bad1" {
  name = "bad1"
}
# ruleid: azure-vmencryption-at-host-enabled
resource "azurerm_linux_virtual_machine_scale_set" "bad2" {
  name = "bad2"
}
# ok: azure-vmencryption-at-host-enabled
resource "azurerm_windows_virtual_machine_scale_set" "good1" {
encryption_at_host_enabled = true
}
# ok: azure-vmencryption-at-host-enabled
resource "azurerm_linux_virtual_machine_scale_set" "good2" {
encryption_at_host_enabled = true
}
