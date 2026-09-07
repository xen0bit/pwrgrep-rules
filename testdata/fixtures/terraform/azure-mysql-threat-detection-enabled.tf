# Fixture for azure-mysql-threat-detection-enabled.
# ruleid: azure-mysql-threat-detection-enabled
resource "azurerm_mysql_server" "bad1" {
  name = "bad1"
}
# ruleid: azure-mysql-threat-detection-enabled
resource "azurerm_mysql_server" "bad2" {
  name = "bad2"
}
# ok: azure-mysql-threat-detection-enabled
resource "azurerm_mysql_server" "good1" {
threat_detection_policy {
    enabled = true
}
}
# ok: azure-mysql-threat-detection-enabled
resource "azurerm_mysql_server" "good2" {
threat_detection_policy {
    enabled = true
}
}
