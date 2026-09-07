# azure-appservice-min-tls-version: app service TLS below 1.2.
resource "azurerm_app_service" "old" {
  name = "old"
  site_config {
    # ruleid: azure-appservice-min-tls-version
    min_tls_version = "1.0"
  }
}

resource "azurerm_app_service" "older" {
  name = "older"
  site_config {
    # ruleid: azure-appservice-min-tls-version
    min_tls_version = "1.1"
  }
}

resource "azurerm_app_service" "new" {
  name = "new"
  site_config {
    # ok: azure-appservice-min-tls-version
    min_tls_version = "1.2"
  }
}

resource "azurerm_app_service" "plain" {
  # ok: azure-appservice-min-tls-version
  name = "plain"
}
