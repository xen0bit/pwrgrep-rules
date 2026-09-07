# Fixture for azure-key-backedby-hsm.
# ruleid: azure-key-backedby-hsm
resource "azurerm_key_vault_key" "bad1" {
  name = "bad1"
}
# ruleid: azure-key-backedby-hsm
resource "azurerm_key_vault_key" "bad2" {
  name = "bad2"
}
# ok: azure-key-backedby-hsm
resource "azurerm_key_vault_key" "good1" {
key_type = "EC-HSM"
}
# ok: azure-key-backedby-hsm
resource "azurerm_key_vault_key" "good2" {
key_type = "RSA-HSM"
}
