variable "mssql_database" {
  type = map(object({
    mssql_databasename = string
    license_type       = string
    max_size_gb        = number
    sku_name           = string
    enclave_type       = string
    collation          = string
    rgname = string
    sqlname = string
  }))
}
