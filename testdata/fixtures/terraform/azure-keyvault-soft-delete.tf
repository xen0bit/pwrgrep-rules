# CWE-284: KeyVault soft delete disabled.
# ruleid: azure-keyvault-soft-delete
resource "azurerm_key_vault" "bad1" {
  name                = "badkv1"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  sku_name            = "standard"
  soft_delete_enabled = false
}
# ruleid: azure-keyvault-soft-delete
resource "azurerm_key_vault" "bad2" {
  name                = "badkv2"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  sku_name            = "standard"
  soft_delete_enabled = false
  purge_protection_enabled = false
}
# ok: azure-keyvault-soft-delete
resource "azurerm_key_vault" "good1" {
  name                = "goodkv1"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  sku_name            = "standard"
  soft_delete_enabled = true
}
# ok: azure-keyvault-soft-delete
resource "azurerm_key_vault" "good2" {
  name                     = "goodkv2"
  location                 = azurerm_resource_group.example.location
  resource_group_name      = azurerm_resource_group.example.name
  sku_name                 = "standard"
  soft_delete_enabled      = true
  purge_protection_enabled = true
}
# ruleid: azure-keyvault-soft-delete
resource "azurerm_key_vault" "bad3" {
  name                = "badkv3"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  sku_name            = "standard"
  soft_delete_enabled = false
  tags = { env = "test" }
}
# ruleid: azure-keyvault-soft-delete
resource "azurerm_key_vault" "bad4" {
  name                = "badkv4"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  sku_name            = "premium"
  soft_delete_enabled = false
}
# ok: azure-keyvault-soft-delete
resource "azurerm_key_vault" "good3" {
  name                     = "goodkv3"
  location                 = azurerm_resource_group.example.location
  resource_group_name      = azurerm_resource_group.example.name
  sku_name                 = "standard"
  soft_delete_enabled      = true
  purge_protection_enabled = true
  tags = { env = "prod" }
}
