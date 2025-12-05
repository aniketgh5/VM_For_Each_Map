
resource "azurerm_subnet" "subnet" {
    for_each = var.subnetblock
  name                 = each.value.subnetname
  resource_group_name  = each.value.rgname
  virtual_network_name = each.value.vnetname
  address_prefixes     = each.value.address_prefixes #["10.0.1.0/24"]

}

# data "azurerm_subnet" "data_subnet" {
#   for_each = var.subnetblock
#   name                 = each.value.subnetname
#   virtual_network_name = each.value.vnetname
#   resource_group_name  = each.value.rgname
# }