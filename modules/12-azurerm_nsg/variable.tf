
variable "nsgblock" {
  type = map(object({
    nsgname       = string
    location      = string
    rgname        = string
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