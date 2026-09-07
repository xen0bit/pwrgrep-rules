# Fixture for azure-vmscale-sets-auto-os-image-patching-enabled.
# ruleid: azure-vmscale-sets-auto-os-image-patching-enabled
resource "azurerm_virtual_machine_scale_set" "bad1" {
  name = "bad1"
}
# ruleid: azure-vmscale-sets-auto-os-image-patching-enabled
resource "azurerm_virtual_machine_scale_set" "bad2" {
  name = "bad2"
}
# ok: azure-vmscale-sets-auto-os-image-patching-enabled
resource "azurerm_virtual_machine_scale_set" "good1" {
automatic_os_upgrade = true
os_profile_windows_config {
  enable_automatic_upgrades = true
}
}
# ok: azure-vmscale-sets-auto-os-image-patching-enabled
resource "azurerm_virtual_machine_scale_set" "good2" {
automatic_os_upgrade = true
os_profile_windows_config {
  enable_automatic_upgrades = true
}
}
