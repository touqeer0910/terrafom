variable "vpc_info" {
  type = object({
    cidr_block           = string
    enable_dns_hostnames = bool
    tags                 = map(string)
  })

}
variable "public_subnets" {
  type = list(object({
    cidr_block = string
    tags       = map(string)
    az         = string
  }))

}
variable "private_subnets" {
  type = list(object({
    cidr_block = string
    tags       = map(string)
    az         = string
  }))

}
