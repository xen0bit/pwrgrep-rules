# Fixture for azure-containergroup-deployed-into-virtualnetwork.
# ruleid: azure-containergroup-deployed-into-virtualnetwork
resource "azurerm_container_group" "bad1" {
container {
}
}
# ruleid: azure-containergroup-deployed-into-virtualnetwork
resource "azurerm_container_group" "bad2" {
container {
}
}
# ok: azure-containergroup-deployed-into-virtualnetwork
resource "azurerm_container_group" "good1" {
container {
}
network_profile_id = "good1-val"  
}
# ok: azure-containergroup-deployed-into-virtualnetwork
resource "azurerm_container_group" "good2" {
container {
}
network_profile_id = "good2-val"  
}
