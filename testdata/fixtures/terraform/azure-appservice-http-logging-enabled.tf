# Fixture for azure-appservice-http-logging-enabled.
# ruleid: azure-appservice-http-logging-enabled
resource "azurerm_app_service" "bad1" {
  name = "bad1"
}
# ruleid: azure-appservice-http-logging-enabled
resource "azurerm_app_service" "bad2" {
  name = "bad2"
}
# ok: azure-appservice-http-logging-enabled
resource "azurerm_app_service" "good1" {
logs {
  http_logs {
  }
}
}
# ok: azure-appservice-http-logging-enabled
resource "azurerm_app_service" "good2" {
logs {
  dynamic "http_logs" {
  }
}
}
