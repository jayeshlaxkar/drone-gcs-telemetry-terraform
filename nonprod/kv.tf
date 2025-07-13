# KEY VAULT INTEGRATION FOR ADMIN PASSWORD
resource "azurerm_user_assigned_identity" "vm_identity" {
  name                = "vm-uai"
  resource_group_name = var.resource_group
  location            = var.location
}

resource "azurerm_key_vault" "kv" {
  name                        = "iac-keyvault"
  location                    = var.location
  resource_group_name         = var.resource_group
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  sku_name                    = "standard"
  soft_delete_retention_days  = 7
  purge_protection_enabled    = false
  enable_rbac_authorization   = false
}

resource "azurerm_key_vault_access_policy" "uai_kv_policy" {
  key_vault_id = azurerm_key_vault.kv.id
  tenant_id    = data.azurerm_client_config.current.tenant_id
  object_id    = azurerm_user_assigned_identity.vm_identity.principal_id

  secret_permissions = ["Get"]
}

resource "azurerm_key_vault_secret" "admin_password" {
  name         = "vmAdminPassword"
  value        = "P@ssword1234!"
  key_vault_id = azurerm_key_vault.kv.id
}

data "azurerm_key_vault" "kv" {
  name                = azurerm_key_vault.kv.name
  resource_group_name = var.resource_group
}

data "azurerm_key_vault_secret" "admin_password" {
  name         = azurerm_key_vault_secret.admin_password.name
  key_vault_id = azurerm_key_vault.kv.id
}

data "azurerm_client_config" "current" {}
