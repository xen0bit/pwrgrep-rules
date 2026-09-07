# azure-postgresql-min-tls-version: Postgres TLS below 1.2 without enforcement.
resource "azurerm_postgresql_server" "old" {
  name = "old"
  # ruleid: azure-postgresql-min-tls-version
  ssl_minimal_tls_version_enforced = "TLS1_0"
}

resource "azurerm_postgresql_server" "older" {
  name = "older"
  # ruleid: azure-postgresql-min-tls-version
  ssl_minimal_tls_version_enforced = "TLS1_1"
}

resource "azurerm_postgresql_server" "enforced" {
  name                      = "enforced"
  ssl_enforcement_enabled   = true
  # ok: azure-postgresql-min-tls-version
  ssl_minimal_tls_version_enforced = "TLS1_2"
}

resource "azurerm_postgresql_server" "plain" {
  # ok: azure-postgresql-min-tls-version
  name = "plain"
}
