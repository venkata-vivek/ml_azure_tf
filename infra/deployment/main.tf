terraform {
  required_providers {
    azurerm =  "4.16"
    databricks = {
        source  = "databricks/databricks"
        version = "1.0.0"
    }
  }
  backend "azurerm" {
    resource_group_name = "shared-storage-ml"
    storage_account_name = "adlsmlpro"
    container_name = "tfstate"
    key = "terraform.tfstate"
  }
}

provider "azurerm" {
  features {}
}

# provider "databricks" {
#     features {}
# }

resource "azurerm_resource_group" "rg-dbr" {
     name = "rg-${var.service_name}-${var.environment}-01"
     location = "eastus2"
}

module "databricks" {
  source = "../modules/databricks"
  service_name = var.service_name
  environment = var.environment
  rg_name = azurerm_resource_group.rg-dbr.name
}