# CWE-319: Storage account allows HTTP.
# ruleid: azure-storage-https-traffic-only
resource "azurerm_storage_account" "bad1" {
  name                     = "bad1storage"
  resource_group_name      = azurerm_resource_group.example.name
  location                 = "eastus"
  account_tier             = "Standard"
  account_replication_type = "LRS"
  enable_https_traffic_only = false
}
# ruleid: azure-storage-https-traffic-only
resource "azurerm_storage_account" "bad2" {
  name                     = "bad2"
  resource_group_name      = azurerm_resource_group.example.name
  location                 = "eastus"
  account_tier             = "Standard"
  account_replication_type = "GRS"
  enable_https_traffic_only = false
}
# ok: azure-storage-https-traffic-only
resource "azurerm_storage_account" "good1" {
  name                     = "good1storage"
  resource_group_name      = azurerm_resource_group.example.name
  location                 = "eastus"
  account_tier             = "Standard"
  account_replication_type = "LRS"
  enable_https_traffic_only = true
}
# ok: azure-storage-https-traffic-only
resource "azurerm_storage_account" "good2" {
  name                     = "good2storage"
  resource_group_name      = azurerm_resource_group.example.name
  location                 = "westus"
  account_tier             = "Standard"
  account_replication_type = "LRS"
  enable_https_traffic_only = true
}
# ruleid: azure-storage-https-traffic-only
resource "azurerm_storage_account" "bad3" {
  name                     = "bad3storage"
  resource_group_name      = azurerm_resource_group.example.name
  location                 = "eastus"
  account_tier             = "Standard"
  account_replication_type = "LRS"
  enable_https_traffic_only = false
  min_tls_version           = "TLS1_2"
}
# ruleid: azure-storage-https-traffic-only
resource "azurerm_storage_account" "bad4" {
  name                     = "bad4"
  resource_group_name      = azurerm_resource_group.example.name
  location                 = "westus2"
  account_tier             = "Standard"
  account_replication_type = "GRS"
  enable_https_traffic_only = false
}
# ok: azure-storage-https-traffic-only
resource "azurerm_storage_account" "good3" {
  name                     = "good3storage"
  resource_group_name      = azurerm_resource_group.example.name
  location                 = "eastus2"
  account_tier             = "Standard"
  account_replication_type = "LRS"
  enable_https_traffic_only = true
  min_tls_version           = "TLS1_2"
}
