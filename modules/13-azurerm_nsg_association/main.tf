resource "azurerm_subnet_network_security_group_association" "nsgassoc" {
    for_each = var.nsgassocblock
  subnet_id                 = data.azurerm_subnet.data_subnet[each.key].id
  network_security_group_id = data.azurerm_network_security_group.nsg_data[each.key].id
}


data "azurerm_subnet" "data_subnet" {
  for_each = var.nsgassocblock
  name                 = each.value.subnetname
  virtual_network_name = each.value.vnetname
  resource_group_name  = each.value.rgname
}


data "azurerm_network_security_group" "nsg_data" {
    for_each = var.nsgassocblock
  name                = each.value.nsgname
  resource_group_name = each.value.rgname
}