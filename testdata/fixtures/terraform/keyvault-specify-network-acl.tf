# Fixture for keyvault-specify-network-acl.
# ruleid: keyvault-specify-network-acl
resource "azurerm_key_vault" "bad1" {
  name = "bad1"
}
# ruleid: keyvault-specify-network-acl
resource "azurerm_key_vault" "bad2" {
network_acls {
    default_action = "Allow"
}
}
# ok: keyvault-specify-network-acl
resource "azurerm_key_vault" "good1" {
network_acls {
    default_action = "Deny"
}
}
# ok: keyvault-specify-network-acl
resource "azurerm_key_vault" "good2" {
network_acls {
    default_action = "Deny"
}
}
