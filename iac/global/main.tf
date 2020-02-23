terraform {
  backend "azurerm" {}
}

provider "azurerm" {
  version = "~>1.43"
}

locals {
  environment_name        = "shared"
  resource_group_name     = "rg-realworld-${local.environment_name}-001"
  container_registry_name = "realworld"
  location                = "eastus"
}

module "container-registry" {
  source = "./container-registry"

  resource_group_name     = local.resource_group_name
  container_registry_name = local.container_registry_name
  location                = local.location
}
