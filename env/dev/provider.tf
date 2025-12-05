terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.54.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "backend-rg02"
    storage_account_name = "backendstg03"
    container_name       = "aniket"
    key                  = "dev.tfstate"
  }
}

provider "azurerm" {
  # Configuration options
  features {
  }
  subscription_id = "249a05f7-c643-4c2a-a2b0-0c1dc39022b7"
}