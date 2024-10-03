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
## this is web sec grp

variable "web_security_group" {
  type = object({
    name = string
    ingress = list(object({
      from_port  = number
      protocol   = string
      cidr_range = string
    }))

  })

}
#this app sec grp

variable "app_security_group" {
  type = object({
    name = string
    ingress = list(object({
      from_port  = number
      protocol   = string
      cidr_range = string
    }))

  })

}
# this db sec grp

variable "db_security_group" {
  type = object({
    name = string
    ingress = list(object({
      from_port  = number
      
      protocol   = string
      cidr_range = string
    }))

  })

}

