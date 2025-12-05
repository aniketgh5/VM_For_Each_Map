variable "subnetblock" {
type = map(object({
  subnetname = string
  rgname = string
  vnetname = string
  
  address_prefixes = list(string)
}))  
}
