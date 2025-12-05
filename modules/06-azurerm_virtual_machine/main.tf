

resource "azurerm_linux_virtual_machine" "vm" {
  for_each                        = var.vmblock
  name                            = each.value.vmname
  resource_group_name             = each.value.rgname
  location                        = each.value.location
  size                            = each.value.size #"Standard_F2"
  admin_username                  = each.value.username
  admin_password                  = each.value.password
  disable_password_authentication = false
  network_interface_ids = [
    data.azurerm_network_interface.data_nic[each.key].id,
  ]


  # --------------------------
  # FIXED: Only ONE os_disk {}
  # --------------------------
  os_disk {
    name                 = each.value.os_disk.name
    caching              = each.value.os_disk.caching
    storage_account_type = each.value.os_disk.storage_account_type
    disk_size_gb         = each.value.os_disk.disk_size_gb
  }

  # ---------------------------------------
  # FIXED: Only ONE source_image_reference {}
  # ---------------------------------------
  source_image_reference {
    publisher = each.value.source_image_reference.publisher
    offer     = each.value.source_image_reference.offer
    sku       = each.value.source_image_reference.sku
    version   = each.value.source_image_reference.version
  }
}


data "azurerm_network_interface" "data_nic" {
  for_each            = var.vmblock
  name                = each.value.nicname
  resource_group_name = each.value.rgname
}
