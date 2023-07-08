terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.10.0"
    }
  }
}

provider "azurerm" {
  subscription_id = "XXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
  tenant_id       = "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
  client_id       = "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
  client_secret   = var.client_secret
  features {}
}
