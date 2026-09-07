# Fixture for azure-secret-content-type.
# ruleid: azure-secret-content-type
resource "azurerm_key_vault_secret" "bad1" {
  name = "bad1"
}
# ruleid: azure-secret-content-type
resource "azurerm_key_vault_secret" "bad2" {
  name = "bad2"
}
# ok: azure-secret-content-type
resource "azurerm_key_vault_secret" "good1" {
content_type = "good1-val"
}
# ok: azure-secret-content-type
resource "azurerm_key_vault_secret" "good2" {
content_type = "good2-val"
}
