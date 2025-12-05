variable "nicblock" {
  type = map(object({
    nicname  = string
    location = string
    rgname   = string
    subnetname = string
    vnetname = string
    pipname = string
    ip_configuration = list(object({
      ipname                        = string
      private_ip_address_allocation = string
      
      }
      )
    )
  }))
}
