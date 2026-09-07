# Fixture for azure-appservice-enabled-failed-request.
# ruleid: azure-appservice-enabled-failed-request
resource "azurerm_app_service" "bad1" {
  name = "bad1"
}
# ruleid: azure-appservice-enabled-failed-request
resource "azurerm_app_service" "bad2" {
  name = "bad2"
}
# ok: azure-appservice-enabled-failed-request
resource "azurerm_app_service" "good1" {
logs {
  failed_request_tracing_enabled = true
}
}
# ok: azure-appservice-enabled-failed-request
resource "azurerm_app_service" "good2" {
logs {
  failed_request_tracing_enabled = true
}
}
