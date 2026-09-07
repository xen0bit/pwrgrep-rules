# Fixture for azure-keyvault-enables-purge-protection.
# ruleid: azure-keyvault-enables-purge-protection
resource "azurerm_key_vault" "bad1" {
  name = "bad1"
}
# ruleid: azure-keyvault-enables-purge-protection
resource "azurerm_key_vault" "bad2" {
  name = "bad2"
}
# ok: azure-keyvault-enables-purge-protection
resource "azurerm_key_vault" "good1" {
purge_protection_enabled = true
}
# ok: azure-keyvault-enables-purge-protection
resource "azurerm_key_vault" "good2" {
purge_protection_enabled = true
}
