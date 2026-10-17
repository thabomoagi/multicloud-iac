terraform {
  required_version = ">= 1.10.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }

  backend "azurerm" {
    resource_group_name  = "multicloud-iac-state-rg"
    storage_account_name = "multicloudiacstatesa"
    container_name       = "tfstate"
    key                  = "dev/vnet/terraform.tfstate"
  }
}

provider "azurerm" {
  features {}
}

module "development_vnet" {
  source = "../../modules/azure-vnet"

  environment         = var.environment
  location            = var.azure_region
  vnet_cidr           = var.vnet_cidr
  public_subnet_cidr  = var.public_subnet_cidr
  private_subnet_cidr = var.private_subnet_cidr
}
