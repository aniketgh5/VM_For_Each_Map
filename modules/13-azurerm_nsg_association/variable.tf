variable "nsgassocblock" {
  type = map(object({
    subnetname = string
    rgname = string
    vnetname = string
    nsgname = string 
  }))
}