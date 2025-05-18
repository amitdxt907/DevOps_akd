terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.28.0"
    }
  }
}

provider "azurerm" {
  features {}
  subscription_id = "648e9ec4-74ae-48a7-a2fe-274451f84c77"
}

# Resource Group-1
resource "azurerm_resource_group" "RG-Chamketis-2" {
  name     = "RG-Chamketis-2"
  location = "eastus"
}

# Storage accout-1
resource "azurerm_storage_account" "SA-Chamketis-2" {
  name                     = "sachamketis2"
  resource_group_name      = "RG-Chamketis-2"
  location                 = "eastus"
  account_tier             = "Standard"
  account_replication_type = "GRS"
  # Using Depends_On here
  depends_on = [azurerm_resource_group.RG-Chamketis-2]
}
# Storage accout-2
resource "azurerm_storage_account" "SA-Chamketis-3" {
  name                     = "sachamketis3"
  resource_group_name      = "RG-Chamketis-2"
  location                 = "eastus"
  account_tier             = "Standard"
  account_replication_type = "GRS"
  # Using Depends_On here
  depends_on = [azurerm_resource_group.RG-Chamketis-2]
}









