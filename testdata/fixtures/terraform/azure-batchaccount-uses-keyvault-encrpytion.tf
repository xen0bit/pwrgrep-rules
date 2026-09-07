# Fixture for azure-batchaccount-uses-keyvault-encrpytion.
# ruleid: azure-batchaccount-uses-keyvault-encrpytion
resource "azurerm_batch_account" "bad1" {
  name = "bad1"
}
# ruleid: azure-batchaccount-uses-keyvault-encrpytion
resource "azurerm_batch_account" "bad2" {
  name = "bad2"
}
# ok: azure-batchaccount-uses-keyvault-encrpytion
resource "azurerm_batch_account" "good1" {
key_vault_reference {
}
}
# ok: azure-batchaccount-uses-keyvault-encrpytion
resource "azurerm_batch_account" "good2" {
key_vault_reference {
}
}
