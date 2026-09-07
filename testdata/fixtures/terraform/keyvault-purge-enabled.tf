# Fixture for keyvault-purge-enabled.
# ruleid: keyvault-purge-enabled
resource "azurerm_key_vault" "bad1" {
  name = "bad1"
}
# ruleid: keyvault-purge-enabled
resource "azurerm_key_vault" "bad2" {
  purge_protection_enabled = false
}
# ok: keyvault-purge-enabled
resource "azurerm_key_vault" "good1" {
 purge_protection_enabled = true
}
# ok: keyvault-purge-enabled
resource "azurerm_key_vault" "good2" {
 purge_protection_enabled = true
}
