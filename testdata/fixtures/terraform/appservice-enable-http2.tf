# Fixture for appservice-enable-http2.
# ruleid: appservice-enable-http2
resource "azurerm_app_service" "bad1" {
  name = "bad1"
}
# ruleid: appservice-enable-http2
resource "azurerm_app_service" "bad2" {
  site_config {
    http2_enabled = false
  }
}
# ok: appservice-enable-http2
resource "azurerm_app_service" "good1" {
  site_config {
    http2_enabled = true
  }
}
# ok: appservice-enable-http2
resource "azurerm_app_service" "good2" {
  site_config {
    http2_enabled = true
  }
}
