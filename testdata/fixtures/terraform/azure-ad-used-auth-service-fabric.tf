# Fixture for azure-ad-used-auth-service-fabric.
# ruleid: azure-ad-used-auth-service-fabric
resource "azurerm_service_fabric_cluster" "bad1" {
  name = "bad1"
}
# ruleid: azure-ad-used-auth-service-fabric
resource "azurerm_service_fabric_cluster" "bad2" {
  name = "bad2"
}
# ok: azure-ad-used-auth-service-fabric
resource "azurerm_service_fabric_cluster" "good1" {
azure_active_directory {
  tenant_id = "good1-val"
}
}
# ok: azure-ad-used-auth-service-fabric
resource "azurerm_service_fabric_cluster" "good2" {
azure_active_directory {
  tenant_id = "good2-val"
}
}
