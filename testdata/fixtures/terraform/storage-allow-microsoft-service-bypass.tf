# Fixture for storage-allow-microsoft-service-bypass.
# ruleid: storage-allow-microsoft-service-bypass
resource "azurerm_storage_account_network_rules" "bad1" {
bypass = ["example-val"]
}
# ruleid: storage-allow-microsoft-service-bypass
resource "azurerm_storage_account" "bad2" {
  network_rules {
    bypass = ["example-val"]
  }
}
# ok: storage-allow-microsoft-service-bypass
resource "azurerm_storage_account" "good1" {
  network_rules {
    bypass = ["good1-val", "AzureServices"]
  }
}
# ok: storage-allow-microsoft-service-bypass
resource "azurerm_storage_account_network_rules" "good2" {
  bypass = ["good2-val", "AzureServices"]
}
