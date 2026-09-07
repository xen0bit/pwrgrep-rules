# Fixture for storage-default-action-deny.
# ruleid: storage-default-action-deny
resource "azurerm_storage_account_network_rules" "bad1" {
  default_action = "Allow"
}
# ruleid: storage-default-action-deny
resource "azurerm_storage_account_network_rules" "bad2" {
  default_action = "Allow"
}
# ok: storage-default-action-deny
resource "azurerm_storage_account_network_rules" "good1" {
  default_action = "Deny"
}
# ok: storage-default-action-deny
resource "azurerm_storage_account_network_rules" "good2" {
  default_action = "Deny"
}
