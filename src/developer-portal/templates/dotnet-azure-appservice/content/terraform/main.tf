terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.0"
    }
  }

  # Backend config is provided via -backend-config args in the pipeline.
  backend "azurerm" {}
}

provider "azurerm" {
  features {}
  subscription_id = var.subscription_id
}

resource "azurerm_service_plan" "main" {
  name                = "asp-${{ values.name }}"
  resource_group_name = var.resource_group_name
  location            = var.location
  os_type             = "Linux"
  sku_name            = var.app_service_sku
}

resource "azurerm_linux_web_app" "main" {
  name                = "app-${{ values.name }}"
  resource_group_name = var.resource_group_name
  location            = var.location
  service_plan_id     = azurerm_service_plan.main.id

  site_config {
    application_stack {
      dotnet_version = "9.0"
    }
    always_on = false
  }

  app_settings = {
    ASPNETCORE_ENVIRONMENT = var.environment
  }
}
