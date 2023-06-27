# Configure the Azure provider
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0.2"
    }
  }

  required_version = ">= 1.1.0"
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = "myTFResourceGroup"
  location = var.resource_group_location

  tags = {
    "ENV"      = "PlayGround"
    "LOCATION" = "Schweiz"
  }
}

# Create a virtual network
resource "azurerm_virtual_network" "vnet" {
  name                = "myTFVnet"
  address_space       = ["10.0.0.0/23"]
  location            = var.resource_group_location
  resource_group_name = azurerm_resource_group.rg.name

  tags = {
    "ENV"      = "PlayGround"
    "LOCATION" = "Schweiz"
  }

}
