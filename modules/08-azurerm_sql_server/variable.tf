
variable "sqlserverblock" {
  type = map(object({
    sqlname = string
    location = string
    administrator_login = string
    administrator_login_password = string
    version = string
    rgname = string
  }))
}