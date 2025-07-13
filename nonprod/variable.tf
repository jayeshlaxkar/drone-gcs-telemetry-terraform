variable "resource_group" {
  default = "iac-demo-rg"
}

variable "location" {
  default = "East US"
}

variable "vm_admin_username" {
  default = "azureuser"
}

variable "subscription_id" {
  description = "Azure Subscription ID"
  type        = string
}

variable "client_id" {
  description = "Service Principal Client ID (App ID)"
  type        = string
}

variable "client_secret" {
  description = "Service Principal Secret"
  type        = string
  sensitive   = true
}

variable "tenant_id" {
  description = "Azure Tenant ID"
  type        = string
}