
resource "azurerm_virtual_network" "vnet" {
for_each = var.vnetblock

  name                = each.value.vnetname
  location            = each.value.location
  resource_group_name = each.value.rgname
  address_space       = each.value.add_space

  # dynamic "subnet" {
  #   for_each = each.value.subnet
  #   content {
  #     name             = each.value.subname          #"subnet1"
  #   address_prefixes = each.value.address_prefixes            #["10.0.1.0/24"]
  #   }
    
  # }
}