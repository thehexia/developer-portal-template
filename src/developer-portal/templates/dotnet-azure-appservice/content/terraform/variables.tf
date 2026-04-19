variable "subscription_id" {
  description = "The Azure subscription ID"
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
  default     = "${{ values.azureResourceGroup }}"
}

variable "location" {
  description = "The Azure region to deploy resources"
  type        = string
  default     = "${{ values.azureLocation }}"
}

variable "app_service_sku" {
  description = "The App Service plan pricing tier"
  type        = string
  default     = "${{ values.appServiceSku }}"
}

variable "environment" {
  description = "The deployment environment (e.g. Development, Staging, Production)"
  type        = string
  default     = "Production"
}
