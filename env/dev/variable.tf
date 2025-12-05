variable "rgs" {
  type = map(object({
    rgname   = string
    location = string
    tags     = map(string)
  }))
}


variable "vnets" {
  type = map(object({
    vnetname  = string
    location  = string
    rgname    = string
    add_space = list(string) # SHOULD BE LIST, not string!

  }))
}

variable "subnets" {
  type = map(object({
    subnetname       = string
    rgname           = string
    vnetname         = string
    address_prefixes = list(string)
  }))
}


variable "pips" {
  type = map(object({
    pipname           = string
    rgname            = string
    location          = string
    allocation_method = string
    tags              = map(string)
  }))
}




variable "nsgs" {
  type = map(object({
    nsgname  = string
    location = string
    rgname   = string
    security_rule = list(object({
      name                       = string
      priority                   = number
      direction                  = string
      access                     = string
      protocol                   = string
      source_port_range          = string
      destination_port_range     = string
      source_address_prefix      = string
      destination_address_prefix = string

    }))
  }))
}


variable "nics" {
  type = map(object({
    nicname    = string
    location   = string
    rgname     = string
    subnetname = string
    vnetname   = string
    pipname    = string
    ip_configuration = list(object({
      ipname                        = string
      private_ip_address_allocation = string
      }
      )
    )
  }))
}



variable "vms" {
  type = map(object({
    vmname   = string
    rgname   = string
    location = string
    username = string
    password = string
    size     = string
    nicname  = string


    os_disk = object({
      caching              = string
      storage_account_type = string
      name                 = string
      disk_size_gb         = number
    })
    source_image_reference = object({
      publisher = string
      offer     = string
      sku       = string
      version   = string
    })
    }
  ))
}




variable "nsgassocs" {
  type = map(object({
    subnetname = string
    rgname     = string
    vnetname   = string
    nsgname    = string
  }))
}





variable "sqlserverblocks" {
  type = map(object({
    sqlname                      = string
    location                     = string
    administrator_login          = string
    administrator_login_password = string
    version                      = string
    rgname                       = string

  }))
}


variable "mssql_database_block" {
  type = map(object({
    mssql_databasename = string
    license_type       = string
    max_size_gb        = number
    sku_name           = string
    enclave_type       = string
    collation          = string
    rgname             = string
    sqlname            = string
  }))
}