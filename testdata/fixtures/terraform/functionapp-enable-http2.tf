# Fixture for functionapp-enable-http2.
# ruleid: functionapp-enable-http2
resource "azurerm_function_app" "bad1" {
  name = "bad1"
}
# ruleid: functionapp-enable-http2
resource "azurerm_function_app" "bad2" {
  site_config {
    http2_enabled = false
  }
}
# ok: functionapp-enable-http2
resource "azurerm_function_app" "good1" {
  site_config {
    http2_enabled = true
  }
}
# ok: functionapp-enable-http2
resource "azurerm_function_app" "good2" {
  site_config {
    http2_enabled = true
  }
}
