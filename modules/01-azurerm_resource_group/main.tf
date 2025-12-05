
resource "azurerm_resource_group" "rgblock" {
  for_each = var.rgblock
  name     = each.value.rgname
  location = each.value.location
  tags = each.value.tags
}