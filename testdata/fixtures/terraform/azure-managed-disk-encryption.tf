# Fixture for azure-managed-disk-encryption.
# ruleid: azure-managed-disk-encryption
resource "azurerm_managed_disk" "bad1" {
encryption_settings {
  enabled = false
}
}
# ruleid: azure-managed-disk-encryption
resource "azurerm_managed_disk" "bad2" {
encryption_settings {
  enabled = false
}
}
# ok: azure-managed-disk-encryption
resource "azurerm_managed_disk" "good1" {
encryption_settings {
  enabled = true
}
}
# ok: azure-managed-disk-encryption
resource "azurerm_managed_disk" "good2" {
  name = "good2"
}
