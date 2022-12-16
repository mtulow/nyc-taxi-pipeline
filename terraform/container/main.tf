provider "azurerm" {
  features {}
}

# Create resource group
resource "azurerm_resource_group" "rg" {
  name     = "${var.prefix}-resources"
  location = var.location
}
# Create storage account
resource "azurerm_storage_account" "datalakeacct" {
  name                = "${var.prefix}storageacct"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location

  account_tier                    = "Standard"
  account_kind                    = "StorageV2"
  account_replication_type        = "LRS"
  enable_https_traffic_only       = true
  access_tier                     = "Hot"
  allow_nested_items_to_be_public = true
}
# Create storage container
resource "azurerm_storage_container" "datalake" {
  name                  = "${var.prefix}storagecontainer"
  storage_account_name  = azurerm_storage_account.datalakeacct.name
  container_access_type = "blob"
}