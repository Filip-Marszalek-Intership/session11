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

resource "azurerm_service_plan" "example" {
  name                = var.appServiceName
  resource_group_name = "test"
  location            = var.location
  os_type             = "Linux"
  sku_name            = var.pricingTier
}

resource "azurerm_linux_web_app" "example" {
  name                = format("%s-%s",var.appServiceName,"webapp")
  resource_group_name = "test"
  location            = var.location
  service_plan_id     = azurerm_service_plan.example.id

  site_config {
    worker_count = var.numOfNodes
    application_stack {
      docker_image     = var.dockerImage
      docker_image_tag = "latest"
    }
  }
}