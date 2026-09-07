# azure-functionapp-disallow-cors: function CORS open to every origin.
resource "azurerm_function_app" "open" {
  name = "open"
  site_config {
    cors {
      # ruleid: azure-functionapp-disallow-cors
      allowed_origins = ["*"]
    }
  }
}

resource "azurerm_function_app" "open2" {
  name = "open2"
  site_config {
    cors {
      # ruleid: azure-functionapp-disallow-cors
      allowed_origins = ["*", "https://example.com"]
    }
  }
}

resource "azurerm_function_app" "shut" {
  name = "shut"
  site_config {
    cors {
      # ok: azure-functionapp-disallow-cors
      allowed_origins = ["https://example.com"]
    }
  }
}

resource "azurerm_function_app" "plain" {
  # ok: azure-functionapp-disallow-cors
  name = "plain"
}
