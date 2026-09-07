# Fixture for azure-keyvault-enables-soft-delete.
# ruleid: azure-keyvault-enables-soft-delete
resource "azurerm_key_vault" "bad1" {
soft_delete_enabled = false
}
# ruleid: azure-keyvault-enables-soft-delete
resource "azurerm_key_vault" "bad2" {
soft_delete_enabled = false
}
# ok: azure-keyvault-enables-soft-delete
resource "azurerm_key_vault" "good1" {
soft_delete_enabled = true
}
# ok: azure-keyvault-enables-soft-delete
resource "azurerm_key_vault" "good2" {
  name = "good2"
}
