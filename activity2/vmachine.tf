resource "azurerm_resource_group" "base" {
  name     = var.resource_group_name
  location = var.resource_group_name_location

}
resource "azurerm_virtual_network" "base" {
  count = length(var.virtual_name)
  name                = var.virtual_name[count.index].name
  resource_group_name = azurerm_resource_group.base.name
  address_space       = var.virtual_name[count.index].vnet_address
  location            = azurerm_resource_group.base.location

}

resource "azurerm_subnet" "subnet" {
  count = length(var.subnet)
  name                 = var.subnet[count.index].name
  resource_group_name  = azurerm_resource_group.base.name
  virtual_network_name = azurerm_resource_group.base.name
  address_prefixes     = var.subnet[count.index].sub_address
}