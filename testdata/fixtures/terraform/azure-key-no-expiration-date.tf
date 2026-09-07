# Fixture for azure-key-no-expiration-date.
# ruleid: azure-key-no-expiration-date
resource "azurerm_key_vault_key" "bad1" {
  name = "bad1"
}
# ruleid: azure-key-no-expiration-date
resource "azurerm_key_vault_key" "bad2" {
  name = "bad2"
}
# ok: azure-key-no-expiration-date
resource "azurerm_key_vault_key" "good1" {
expiration_date = "good1-val"
}
# ok: azure-key-no-expiration-date
resource "azurerm_key_vault_key" "good2" {
expiration_date = "good2-val"
}
