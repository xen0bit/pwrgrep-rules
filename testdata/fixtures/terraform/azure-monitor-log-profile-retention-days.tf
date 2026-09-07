# Fixture for azure-monitor-log-profile-retention-days.
# ruleid: azure-monitor-log-profile-retention-days
resource "azurerm_monitor_log_profile" "bad1" {
  name = "bad1"
}
# ruleid: azure-monitor-log-profile-retention-days
resource "azurerm_monitor_log_profile" "bad2" {
  name = "bad2"
}
# ok: azure-monitor-log-profile-retention-days
resource "azurerm_monitor_log_profile" "good1" {
retention_policy {
  enabled = true
  days = 365
}
}
# ok: azure-monitor-log-profile-retention-days
resource "azurerm_monitor_log_profile" "good2" {
retention_policy {
  enabled = false
  days = 0
}
}
