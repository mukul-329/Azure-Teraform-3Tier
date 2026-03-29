variable "location" {
  default = "East US"
}

variable "resource_group_name" {
  default = "rg-3tier-demo"
}

variable "admin_username" {
  default = "azureuser"
}

variable "admin_password" {
  description = "VM password"
  sensitive   = true
}