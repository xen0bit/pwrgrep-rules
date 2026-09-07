# azure-monitor-log-profile-retention-days: short activity-log retention.
# ruleid: azure-monitor-log-profile-retention-days
resource "azurerm_monitor_log_profile" "short" {
  name = "short"
  retention_policy {
    enabled = true
    days = 30
  }
}

# ruleid: azure-monitor-log-profile-retention-days
resource "azurerm_monitor_log_profile" "shorter" {
  name = "shorter"
  retention_policy {
    enabled = true
    days = 100
  }
}

# ok: azure-monitor-log-profile-retention-days
resource "azurerm_monitor_log_profile" "long" {
  name = "long"
  retention_policy {
    enabled = true
    days = 400
  }
}

# ok: azure-monitor-log-profile-retention-days
resource "azurerm_monitor_log_profile" "off" {
  name = "off"
  retention_policy {
    enabled = false
    days = 0
  }
}
