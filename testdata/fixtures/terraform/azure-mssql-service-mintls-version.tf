# azure-mssql-service-mintls-version: MSSQL TLS below 1.2.
resource "azurerm_mssql_server" "old" {
  name = "old"
  # ruleid: azure-mssql-service-mintls-version
  minimum_tls_version = "1.0"
}

resource "azurerm_mssql_server" "older" {
  name = "older"
  # ruleid: azure-mssql-service-mintls-version
  minimum_tls_version = "1.1"
}

resource "azurerm_mssql_server" "new" {
  name = "new"
  # ok: azure-mssql-service-mintls-version
  minimum_tls_version = "1.2"
}

resource "azurerm_mssql_server" "plain" {
  # ok: azure-mssql-service-mintls-version
  name = "plain"
}
