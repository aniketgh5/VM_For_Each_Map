
resource "azurerm_resource_group" "rg1" {
  name = "kolrg"
  location = "westeurope"
}


output "resource_group_location" {
  value = azurerm_resource_group.rg1.location
}