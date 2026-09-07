# Fixture for azure-keyvault-recovery-enabled.
# ruleid: azure-keyvault-recovery-enabled
resource "azurerm_key_vault" "bad1" {
}
# ruleid: azure-keyvault-recovery-enabled
resource "azurerm_key_vault" "bad2" {
}
# ok: azure-keyvault-recovery-enabled
resource "azurerm_key_vault" "good1" {
purge_protection_enabled = true
}
# ok: azure-keyvault-recovery-enabled
resource "azurerm_key_vault" "good2" {
purge_protection_enabled = true
}
