resource "azurerm_mssql_server" "sql" {
  for_each                     = var.sqlserverblock
  name                         = each.value.sqlname
  resource_group_name          = each.value.rgname
  location                     = each.value.location
  administrator_login          = each.value.administrator_login
  administrator_login_password = each.value.administrator_login_password
  version                      = each.value.version
}


