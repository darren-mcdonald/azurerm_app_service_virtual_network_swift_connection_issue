resource "azurerm_resource_group" "example" {
  name     = "test"
  location = "North Europe"
}

resource "azurerm_app_service_plan" "example" {
  name                = "example-appserviceplan"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name

  sku {
    tier = "Standard"
    size = "S1"
  }
}

resource "azurerm_app_service" "example" {
  name                = "my-example-app-service"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  app_service_plan_id = azurerm_app_service_plan.example.id
}

# We can try the inverse and attempt to create the link from the app sub
# resource "azurerm_app_service_virtual_network_swift_connection" "example" {
#   app_service_id = azurerm_app_service.example.id
#   subnet_id      = azurerm_subnet.example.id
# }