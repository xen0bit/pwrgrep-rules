# Fixture for keyvault-ensure-key-expires.
# ruleid: keyvault-ensure-key-expires
resource "azurerm_key_vault_key" "bad1" {
  name = "bad1"
}
# ruleid: keyvault-ensure-key-expires
resource "azurerm_key_vault_key" "bad2" {
  name = "bad2"
}
# ok: keyvault-ensure-key-expires
resource "azurerm_key_vault_key" "good1" {
expiration_date = "good1-val"
}
# ok: keyvault-ensure-key-expires
resource "azurerm_key_vault_key" "good2" {
expiration_date = "good2-val"
}
