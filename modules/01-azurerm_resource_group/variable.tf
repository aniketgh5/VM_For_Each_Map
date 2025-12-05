variable "rgblock" {
    type = map(object({
      rgname = string
      location = string
      tags = map(string)
    }))
}



