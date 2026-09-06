# CWE-326: Storage account TLS version outdated.
# ruleid: azure-storage-account-minimum-tlsversion
resource "azurerm_storage_account" "bad1" {
  name                = "bad1storage"
  resource_group_name = azurerm_resource_group.example.name
  location            = "eastus"
}
# ruleid: azure-storage-account-minimum-tlsversion
resource "azurerm_storage_account" "bad2" {
  name                = "bad2storage"
  resource_group_name = azurerm_resource_group.example.name
  location            = "eastus"
  min_tls_version     = "TLS1_0"
}
# ok: azure-storage-account-minimum-tlsversion
resource "azurerm_storage_account" "good1" {
  name                = "good1storage"
  resource_group_name = azurerm_resource_group.example.name
  location            = "eastus"
  min_tls_version     = "TLS1_2"
}
# ok: azure-storage-account-minimum-tlsversion
resource "azurerm_storage_account" "good2" {
  name                = "good2storage"
  resource_group_name = azurerm_resource_group.example.name
  location            = "eastus"
  min_tls_version     = "TLS1_3"
}
# ruleid: azure-storage-account-minimum-tlsversion
resource "azurerm_storage_account" "bad3" {
  name                = "bad3storage"
  resource_group_name = azurerm_resource_group.example.name
  location            = "westus"
  account_tier             = "Standard"
  account_replication_type = "LRS"
}
# ruleid: azure-storage-account-minimum-tlsversion
resource "azurerm_storage_account" "bad4" {
  name                = "bad4storage"
  resource_group_name = azurerm_resource_group.example.name
  location            = "eastus"
  min_tls_version     = "TLS1_1"
  account_tier             = "Standard"
  account_replication_type = "GRS"
}
# ok: azure-storage-account-minimum-tlsversion
resource "azurerm_storage_account" "good3" {
  name                = "good3storage"
  resource_group_name = azurerm_resource_group.example.name
  location            = "eastus"
  min_tls_version     = "TLS1_2"
  account_tier             = "Standard"
  account_replication_type = "ZRS"
}
