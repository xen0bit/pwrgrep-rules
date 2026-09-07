# Fixture for azure-managed-disk-encryption-set.
# ruleid: azure-managed-disk-encryption-set
resource "azurerm_managed_disk" "bad1" {
  name = "bad1"
}
# ruleid: azure-managed-disk-encryption-set
resource "azurerm_managed_disk" "bad2" {
  name = "bad2"
}
# ok: azure-managed-disk-encryption-set
resource "azurerm_managed_disk" "good1" {
disk_encryption_set_id = "good1-val"
}
# ok: azure-managed-disk-encryption-set
resource "azurerm_managed_disk" "good2" {
disk_encryption_set_id = "good2-val"
}
