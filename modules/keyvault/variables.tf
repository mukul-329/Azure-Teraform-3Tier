variable "resource_group_name" {}
variable "tenant_id" {
  description = "The ID of the tenant where the Key Vault will be created."
}
variable "location" {
  description = "The Azure region where the Key Vault will be created."
}
variable "admin_password" {
  description = "The administrator password for the virtual machines."
}