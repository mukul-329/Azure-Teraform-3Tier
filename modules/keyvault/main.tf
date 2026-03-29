resource "azurerm_key_vault" "kv" {
  name                        = "kv-3tier-demo"
  location                    = var.location
  resource_group_name         = var.resource_group_name
  tenant_id                   = var.tenant_id
  sku_name                    = "standard"
}

resource "azurerm_key_vault_secret" "vm_password" {
  name         = "vm-password"
  value        = var.admin_password
  key_vault_id = azurerm_key_vault.kv.id
}