# Fixture for storage-use-secure-tls-policy.
# ruleid: storage-use-secure-tls-policy
resource "azurerm_storage_account" "bad1" {
  min_tls_version = "TLS1_0"
}
# ruleid: storage-use-secure-tls-policy
resource "azurerm_storage_account" "bad2" {
  name = "bad2"
}
# ok: storage-use-secure-tls-policy
resource "azurerm_storage_account" "good1" {
  min_tls_version = "TLS1_2"
}
# ok: storage-use-secure-tls-policy
resource "azurerm_storage_account" "good2" {
  min_tls_version = "TLS1_2"
}
