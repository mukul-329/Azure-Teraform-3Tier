resource "azurerm_mssql_server" "sql" {
  name                         = "sqlserver3tierdemo"
  resource_group_name          = var.resource_group_name
  location                     = var.location
  version                      = "12.0"
  administrator_login          = "sqladmin"
  administrator_login_password = "Password@1234"
}

resource "azurerm_mssql_database" "db" {
  name           = "appdb"
  server_id      = azurerm_mssql_server.sql.id
  sku_name       = "S0"
}

resource "azurerm_mssql_firewall_rule" "allow_azure" {
  name             = "allow-azure"
  server_id        = azurerm_mssql_server.sql.id
  start_ip_address = "0.0.0.0"
  end_ip_address   = "0.0.0.0"
}