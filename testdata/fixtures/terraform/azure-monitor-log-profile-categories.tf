# Fixture for azure-monitor-log-profile-categories.
# ruleid: azure-monitor-log-profile-categories
resource "azurerm_monitor_log_profile" "bad1" {
  name = "bad1"
}
# ruleid: azure-monitor-log-profile-categories
resource "azurerm_monitor_log_profile" "bad2" {
  name = "bad2"
}
# ok: azure-monitor-log-profile-categories
resource "azurerm_monitor_log_profile" "good1" {
categories = [
"Action",
"Delete",
"Write",
]
}
# ok: azure-monitor-log-profile-categories
resource "azurerm_monitor_log_profile" "good2" {
categories = [
"Action",
"Delete",
"Write",
]
}
