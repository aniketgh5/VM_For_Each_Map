data "azurerm_mssql_server" "data_mssql_server" {
    for_each = var.mssql_database
  name                = each.value.sqlname
  resource_group_name = each.value.rgname
}