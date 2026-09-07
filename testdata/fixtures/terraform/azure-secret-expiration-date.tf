# Fixture for azure-secret-expiration-date.
# ruleid: azure-secret-expiration-date
resource "azurerm_key_vault_secret" "bad1" {
  name = "bad1"
}
# ruleid: azure-secret-expiration-date
resource "azurerm_key_vault_secret" "bad2" {
  name = "bad2"
}
# ok: azure-secret-expiration-date
resource "azurerm_key_vault_secret" "good1" {
expiration_date = "good1-val"
}
# ok: azure-secret-expiration-date
resource "azurerm_key_vault_secret" "good2" {
expiration_date = "good2-val"
}
