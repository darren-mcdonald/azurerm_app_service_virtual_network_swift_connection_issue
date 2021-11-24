resource "azurerm_resource_group" "vnet_rg" {
  provider = azurerm.vnetsubscription
  name     = "vnet-rg"
  location = "North Europe"
}

resource "azurerm_virtual_network" "example" {
  provider            = azurerm.vnetsubscription
  name                = "my-vnet"
  location            = azurerm_resource_group.vnet_rg.location
  resource_group_name = azurerm_resource_group.vnet_rg.name
  address_space       = ["10.0.0.0/16"]
}

resource "azurerm_subnet" "example" {
  provider             = azurerm.vnetsubscription
  name                 = "example-subnet"
  resource_group_name  = azurerm_resource_group.vnet_rg.name
  virtual_network_name = azurerm_virtual_network.example.name
  address_prefixes     = ["10.14.1.0/28"]
  delegation {
    name = "example-delegation"

    service_delegation {
      name    = "Microsoft.Web/serverFarms"
      actions = ["Microsoft.Network/virtualNetworks/subnets/action"]
    }
  }
}

resource "azurerm_app_service_virtual_network_swift_connection" "example" {
  provider       = azurerm.vnetsubscription
  app_service_id = azurerm_app_service.example.id
  subnet_id      = azurerm_subnet.example.id
}
