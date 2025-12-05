variable "pipblock" {
  type = map(object({
    pipname = string
    rgname = string
    location = string
    allocation_method = string
    tags = map(string)
  }))
}
