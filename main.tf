###########################################
# Creates a New KeyVault & Private Endpoint
###########################################
resource "azurerm_key_vault" "key_vault" {
  name                        = var.kv_name
  location                    = var.location
  resource_group_name         = var.resource_group_name
  tenant_id                   = var.tenant_id
  sku_name                    = "standard"
  enabled_for_disk_encryption = true
  soft_delete_enabled         = true
  purge_protection_enabled    = true
  enable_rbac_authorization   = true
  tags                        = local.tags

  network_acls {
    default_action = var.kv_default_action
    bypass         = "AzureServices"
    ip_rules       = var.kv_allowed_cidr
  }
}

# Configure Diagnostic Settings
module "kv_diagnostic_settings" {
  source  = "andrewCluey/diagnostic_setting/azurerm"
  version = "0.0.3"

  diag_object                = local.diagnostics_settings
  log_analytics_workspace_id = var.la_workspace_id
  resource_id                = azurerm_key_vault.key_vault.id
  resource_name              = azurerm_key_vault.key_vault.name
}
