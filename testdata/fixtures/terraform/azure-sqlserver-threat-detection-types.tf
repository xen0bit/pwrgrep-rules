# Fixture for azure-sqlserver-threat-detection-types.
# ruleid: azure-sqlserver-threat-detection-types
resource "azurerm_mssql_server_security_alert_policy" "bad1" {
  name = "bad1"
}
# ruleid: azure-sqlserver-threat-detection-types
resource "azurerm_mssql_server_security_alert_policy" "bad2" {
  name = "bad2"
}
# ok: azure-sqlserver-threat-detection-types
resource "azurerm_mssql_server_security_alert_policy" "good1" {
state = "Enabled"
disabled_alerts = []
}
# ok: azure-sqlserver-threat-detection-types
resource "azurerm_mssql_server_security_alert_policy" "good2" {
state = "Enabled"
disabled_alerts = []
}
