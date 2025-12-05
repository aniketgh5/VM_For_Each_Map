
variable "vmblock" {
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
      name = string
      disk_size_gb = number
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
