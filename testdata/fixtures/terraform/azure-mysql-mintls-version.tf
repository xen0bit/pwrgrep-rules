# azure-mysql-mintls-version: MySQL TLS below 1.2.
resource "azurerm_mysql_server" "old" {
  name                              = "old"
  # ruleid: azure-mysql-mintls-version
  ssl_minimal_tls_version_enforced = "TLS1_0"
}

resource "azurerm_mysql_server" "older" {
  name = "older"
  # ruleid: azure-mysql-mintls-version
  ssl_minimal_tls_version_enforced = "TLS1_1"
}

resource "azurerm_mysql_server" "new" {
  name = "new"
  # ok: azure-mysql-mintls-version
  ssl_minimal_tls_version_enforced = "TLS1_2"
}

resource "azurerm_mysql_server" "plain" {
  # ok: azure-mysql-mintls-version
  name = "plain"
}
