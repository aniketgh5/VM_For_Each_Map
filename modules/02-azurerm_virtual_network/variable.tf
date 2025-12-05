
variable "vnetblock" {
    type = map(object({
      vnetname = string
      location = string
      rgname = string
       add_space = list(string)   # SHOULD BE LIST, not string!
    
    }))
}