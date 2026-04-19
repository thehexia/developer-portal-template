output "app_service_name" {
  description = "The name of the Azure App Service"
  value       = azurerm_linux_web_app.main.name
}

output "app_service_url" {
  description = "The default hostname of the Azure App Service"
  value       = "https://${azurerm_linux_web_app.main.default_hostname}"
}

output "app_service_plan_id" {
  description = "The resource ID of the App Service Plan"
  value       = azurerm_service_plan.main.id
}
