
module "rg" {
  source  = "../../modules/01-azurerm_resource_group"
  rgblock = var.rgs
}

module "vnet" {
  source     = "../../modules/02-azurerm_virtual_network"
  vnetblock  = var.vnets
  depends_on = [module.rg]
}

module "subnet" {
  source      = "../../modules/03-azurerm_subnet"
  subnetblock = var.subnets
  depends_on  = [module.rg, module.vnet]
}


module "pip" {
  source     = "../../modules/04-azurerm_public_ip"
  pipblock   = var.pips
  depends_on = [module.rg]
}


module "nsg" {
  source     = "../../modules/12-azurerm_nsg"
  depends_on = [module.rg]
  nsgblock   = var.nsgs
}

module "nic" {
  source     = "../../modules/05-azurerm_network_interface"
  depends_on = [module.rg, module.subnet, module.vnet]
  nicblock   = var.nics
}


module "vm" {
  source     = "../../modules/06-azurerm_virtual_machine"
  depends_on = [module.nic, module.nsg, module.pip, module.rg, module.subnet]
  vmblock    = var.vms
}

module "nsgassoc" {
  source        = "../../modules/13-azurerm_nsg_association"
  nsgassocblock = var.nsgassocs
  depends_on    = [module.nsg, module.subnet]
}


# module "mssql" {
#   source         = "../../modules/09-azurerm_sql_database"
#   mssql_database = var.mssql_database_block
#   depends_on     = [module.rg, module.sqlserver]
# }


# module "sqlserver" {
#   source         = "../../modules/08-azurerm_sql_server"
#   depends_on     = [module.rg]
#   sqlserverblock = var.sqlserverblocks
# }