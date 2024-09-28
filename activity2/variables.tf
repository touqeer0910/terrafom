variable "resource_group_name" {
  type    = string
  default = "terra"


}
variable "resource_group_name_location" {
  type    = string
  default = "eastus"


}


variable "virtual_name" {
  type = list(object({
    name = string
    vnet_address = list(string)
  }))
  default = [ {
    name = "terraformvnet"
    vnet_address = ["10.0.0.0/16"]
  } ]
  
}
variable "subnet" {
  type = list(object({
    name = string
    sub_address = list(string)


  }))
  default = [ {
    name = "we1"
    sub_address = [ "10.0.5.0/24" ]
  },
   {
    name = "we2"
    sub_address = [ "10.0.1.0/24" ]
  }

   ]
  
}
