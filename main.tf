terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 2.73.0"
    }
  }
}

provider "azurerm" { #app subscription
  subscription_id = "<APP_SUB_ID>"
  tenant_id       = "<APP_TENANT_ID>"
  client_id       = "<APP_CLIENT_ID>"
  client_secret   = "<APP_CLIENT_SECRET>"
  features {}
}

provider "azurerm" {
  alias = "vnetsubscription"
  subscription_id = "<VNET_SUB_ID>"
  tenant_id       = "<VNET_TENANT_ID>"
  client_id       = "<VNET_CLIENT_ID>"
  client_secret   = "<VNET_CLIENT_SECRET>"
  features {}
}


