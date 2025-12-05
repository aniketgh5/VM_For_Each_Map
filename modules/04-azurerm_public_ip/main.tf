
resource "azurerm_public_ip" "pip" {
  for_each            = var.pipblock
  name                = each.value.pipname
  resource_group_name = each.value.rgname
  location            = each.value.location
  allocation_method   = each.value.allocation_method

  tags = each.value.tags
}


output "public_ip_addresses" {
  description = "All public IP addresses created by this module"
  value = {
    for k, pip in azurerm_public_ip.pip :
    k => pip.ip_address
  }
}


# output "public_ip" {
#   value = azurerm_public_ip.pip["pip1"].ip_address
# }
