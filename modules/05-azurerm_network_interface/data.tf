data "azurerm_subnet" "data_subnet" {
  for_each = var.nicblock
  name                 = each.value.subnetname
  virtual_network_name = each.value.vnetname
  resource_group_name  = each.value.rgname
}

data "azurerm_public_ip" "pip_data" {
  for_each = var.nicblock
  name                = each.value.pipname
  resource_group_name = each.value.rgname
}
