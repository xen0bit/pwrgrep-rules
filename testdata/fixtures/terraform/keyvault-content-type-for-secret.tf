# Fixture for keyvault-content-type-for-secret.
# ruleid: keyvault-content-type-for-secret
resource "azurerm_key_vault_secret" "bad1" {
  name = "bad1"
}
# ruleid: keyvault-content-type-for-secret
resource "azurerm_key_vault_secret" "bad2" {
  name = "bad2"
}
# ok: keyvault-content-type-for-secret
resource "azurerm_key_vault_secret" "good1" {
content_type = "good1-val"
}
# ok: keyvault-content-type-for-secret
resource "azurerm_key_vault_secret" "good2" {
content_type = "good2-val"
}
