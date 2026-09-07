# Fixture for appservice-use-secure-tls-policy.
resource "azurerm_app_service" "bad1" {
# ruleid: appservice-use-secure-tls-policy
  min_tls_version = "example-val"
}
resource "azurerm_app_service" "bad2" {
# ruleid: appservice-use-secure-tls-policy
  min_tls_version = "example-val"
}
# ok: appservice-use-secure-tls-policy
resource "azurerm_app_service" "good1" {
  min_tls_version = "1.2"
}
# ok: appservice-use-secure-tls-policy
resource "azurerm_app_service" "good2" {
  name = "good2"
}
