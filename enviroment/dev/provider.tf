terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=5.0.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "bablu"
    storage_account_name = "bablust"
    container_name       = "bidit"
    key                  = "bk.tfstate"

  }
}

provider "azurerm" {
  subscription_id = "d5184da3-0771-4c5d-9775-0af8d536f827"
  features {}
}
