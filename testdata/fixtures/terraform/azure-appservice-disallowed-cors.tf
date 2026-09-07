# azure-appservice-disallowed-cors: CORS open to every origin.
resource "azurerm_app_service" "open" {
  name = "open"
  site_config {
    cors {
      # ruleid: azure-appservice-disallowed-cors
      allowed_origins = ["*"]
    }
  }
}

resource "azurerm_app_service" "open2" {
  name = "open2"
  site_config {
    cors {
      # ruleid: azure-appservice-disallowed-cors
      allowed_origins = ["*", "https://example.com"]
    }
  }
}

resource "azurerm_app_service" "shut" {
  name = "shut"
  site_config {
    cors {
      # ok: azure-appservice-disallowed-cors
      allowed_origins = ["https://example.com"]
    }
  }
}

resource "azurerm_app_service" "plain" {
  # ok: azure-appservice-disallowed-cors
  name = "plain"
}
