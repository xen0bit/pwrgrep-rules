# Fixture for azure-keyvault-enables-firewall-rules-settings.
# ruleid: azure-keyvault-enables-firewall-rules-settings
resource "azurerm_key_vault" "bad1" {
  name = "bad1"
}
# ruleid: azure-keyvault-enables-firewall-rules-settings
resource "azurerm_key_vault" "bad2" {
  name = "bad2"
}
# ok: azure-keyvault-enables-firewall-rules-settings
resource "azurerm_key_vault" "good1" {
network_acls {
  default_action = "Deny"
}
}
# ok: azure-keyvault-enables-firewall-rules-settings
resource "azurerm_key_vault" "good2" {
network_acls {
  default_action = "Deny"
}
}
