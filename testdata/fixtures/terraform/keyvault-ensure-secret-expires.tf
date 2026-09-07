# Fixture for keyvault-ensure-secret-expires.
# ruleid: keyvault-ensure-secret-expires
resource "azurerm_key_vault_secret" "bad1" {
  name = "bad1"
}
# ruleid: keyvault-ensure-secret-expires
resource "azurerm_key_vault_secret" "bad2" {
  name = "bad2"
}
# ok: keyvault-ensure-secret-expires
resource "azurerm_key_vault_secret" "good1" {
expiration_date = "good1-val"
}
# ok: keyvault-ensure-secret-expires
resource "azurerm_key_vault_secret" "good2" {
expiration_date = "good2-val"
}
