# Fixture for storage-queue-services-logging.
# ruleid: storage-queue-services-logging
resource "azurerm_storage_account" "bad1" {
      queue_properties  {
      }
}
# ruleid: storage-queue-services-logging
resource "azurerm_storage_account" "bad2" {
  name = "bad2"
}
# ok: storage-queue-services-logging
resource "azurerm_storage_account" "good1" {
        queue_properties  {
          logging {
          }
        }
}
# ok: storage-queue-services-logging
resource "azurerm_storage_account" "good2" {
        queue_properties  {
          logging {
          }
        }
}
