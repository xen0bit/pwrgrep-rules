# CWE-284: CosmosDB public network enabled.
# ruleid: azure-cosmosdb-disables-public-network
resource "azurerm_cosmosdb_account" "bad1" {
  name                = "badcosmos1"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  offer_type          = "Standard"
}
# ruleid: azure-cosmosdb-disables-public-network
resource "azurerm_cosmosdb_account" "bad2" {
  name                = "badcosmos2"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  offer_type          = "Standard"
  public_network_access_enabled = true
}
# ok: azure-cosmosdb-disables-public-network
resource "azurerm_cosmosdb_account" "good1" {
  name                = "goodcosmos1"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  offer_type          = "Standard"
  public_network_access_enabled = false
}
# ok: azure-cosmosdb-disables-public-network
resource "azurerm_cosmosdb_account" "good2" {
  name                          = "goodcosmos2"
  location                      = azurerm_resource_group.example.location
  resource_group_name           = azurerm_resource_group.example.name
  offer_type                    = "Standard"
  public_network_access_enabled = false
  consistency_policy {
    consistency_level = "Session"
  }
}
# ruleid: azure-cosmosdb-disables-public-network
resource "azurerm_cosmosdb_account" "bad3" {
  name                = "badcosmos3"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  offer_type          = "Standard"
  consistency_policy {
    consistency_level = "BoundedStaleness"
  }
}
# ruleid: azure-cosmosdb-disables-public-network
resource "azurerm_cosmosdb_account" "bad4" {
  name                = "badcosmos4"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  offer_type          = "Standard"
  public_network_access_enabled = true
  geo_location {
    location          = "eastus"
    failover_priority = 0
  }
}
# ok: azure-cosmosdb-disables-public-network
resource "azurerm_cosmosdb_account" "good3" {
  name                          = "goodcosmos3"
  location                      = azurerm_resource_group.example.location
  resource_group_name           = azurerm_resource_group.example.name
  offer_type                    = "Standard"
  public_network_access_enabled = false
  ip_range_filter               = "10.0.0.0/24"
}
