resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
}

module "vnet" {
  source              = "./modules/vnet"
  resource_group_name = azurerm_resource_group.rg.name
  location            = var.location
}

module "web" {
  source              = "./modules/web"
  resource_group_name = azurerm_resource_group.rg.name
  location            = var.location
  subnet_id           = module.vnet.web_subnet_id
  admin_username      = var.admin_username
  admin_password      = var.admin_password
}

module "app" {
  source              = "./modules/app"
  resource_group_name = azurerm_resource_group.rg.name
  location            = var.location
  subnet_id           = module.vnet.app_subnet_id
  admin_username      = var.admin_username
  admin_password      = var.admin_password
}

module "db" {
  source              = "./modules/db"
  resource_group_name = azurerm_resource_group.rg.name
  location            = var.location
}