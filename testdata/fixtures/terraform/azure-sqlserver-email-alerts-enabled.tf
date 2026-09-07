# Fixture for azure-sqlserver-email-alerts-enabled.
# ruleid: azure-sqlserver-email-alerts-enabled
resource "azurerm_mssql_server_security_alert_policy" "bad1" {
  name = "bad1"
}
# ruleid: azure-sqlserver-email-alerts-enabled
resource "azurerm_mssql_server_security_alert_policy" "bad2" {
  name = "bad2"
}
# ok: azure-sqlserver-email-alerts-enabled
resource "azurerm_mssql_server_security_alert_policy" "good1" {
state = "Enabled"
email_addresses = ["good1-val"]
}
# ok: azure-sqlserver-email-alerts-enabled
resource "azurerm_mssql_server_security_alert_policy" "good2" {
state = "Enabled"
email_addresses = ["good2-val"]
}
