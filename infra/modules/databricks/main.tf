resource "azurerm_databricks_workspace" "dbr-ml" {
  name = "${var.service_name}-${var.environment}"
  location = "eastus2"
  sku = "premium"
  resource_group_name = var.rg_name
}
